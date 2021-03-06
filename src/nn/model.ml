open Core_kernel.Std

type 'a t =
  { session : Session.t
  ; net : (Nn._1d, 'a) Nn.t
  ; placeholder : 'a Ops.Placeholder.t
  ; save_nodes : [ `unit ] Node.t String.Table.t
  ; load_and_assign_nodes : Node.p list String.Table.t
  }

module Optimizer = struct
  (* We should use some inline records here when they will be available. *)
  type t =
    | Gradient_descent of float
    | Adam of float * float option * float option * float option
    | Momentum of float * float

  let gradient_descent ~learning_rate = Gradient_descent learning_rate

  let adam ~learning_rate ?beta1 ?beta2 ?epsilon () =
    Adam (learning_rate, beta1, beta2, epsilon)

  let momentum ~learning_rate ~momentum =
    Momentum (learning_rate, momentum)

  let get t ~loss =
    match t with
    | Gradient_descent learning_rate ->
      Optimizers.gradient_descent_minimizer ~learning_rate:(Ops.f learning_rate) loss
    | Adam (learning_rate, beta1, beta2, epsilon) ->
      Optimizers.adam_minimizer loss
        ~learning_rate:(Ops.f learning_rate)
        ?beta1:(Option.map beta1 ~f:Ops.f)
        ?beta2:(Option.map beta2 ~f:Ops.f)
        ?epsilon:(Option.map epsilon ~f:Ops.f)
    | Momentum (learning_rate, momentum) ->
      Optimizers.momentum_minimizer loss
        ~learning_rate:(Ops.f learning_rate)
        ~momentum:(Ops.f momentum)
end

module Loss = struct
  type t =
    | Cross_entropy of [ `sum | `mean ]
    | L2 of [ `sum | `mean ]

  let cross_entropy sum_mean = Cross_entropy sum_mean
  let l2 sum_mean = L2 sum_mean

  let get t ~sample_ys ~model_ys =
    let reduce = function
      | `sum -> Ops.reduce_sum
      | `mean -> Ops.reduce_mean
    in
    match t with
    | Cross_entropy sum_mean ->
      Ops.(neg (reduce sum_mean (sample_ys * log model_ys)))
    | L2 sum_mean ->
      Ops.(reduce sum_mean (square (sample_ys - model_ys)))
end

let create net =
  let session = Session.create () in
  let type_ = Nn.type_ net in
  let placeholder = Ops.placeholder ~type_ (Nn.shape net |> Nn.Shape.dim_list) in
  { session
  ; net
  ; placeholder
  ; save_nodes = String.Table.create ()
  ; load_and_assign_nodes = String.Table.create ()
  }

let all_inputs f_or_d ?(named_inputs=[]) t xs =
  let inputs =
    List.map named_inputs ~f:(fun (input_name, value) ->
      let placeholder = Nn.Input_name.to_placeholder input_name in
      f_or_d placeholder value)
  in
  match Nn.default_input t.net with
  | None -> inputs
  | Some input_name ->
    let placeholder = Nn.Input_name.to_placeholder input_name in
    f_or_d placeholder xs :: inputs

let fit_gen f_or_d scalar_f_or_d =
  fun ?named_inputs ?batch_size ?on_epoch ~loss ~optimizer ~epochs ~xs ~ys t ->
    let loss =
      Loss.get loss
        ~sample_ys:(Ops.Placeholder.to_node t.placeholder)
        ~model_ys:(Nn.node t.net)
    in
    let optimizer = Optimizer.get optimizer ~loss in
    let samples = (Tensor.dims xs).(0) in
    let batch_size =
      match batch_size with
      | None -> None
      | Some batch_size when batch_size > samples -> None
      | Some _ as s -> s
    in
    let inputs ~xs ~ys =
      (f_or_d t.placeholder ys)
      :: all_inputs f_or_d ?named_inputs t xs
    in
    let on_epoch =
      Option.value on_epoch
        ~default:(fun (_:int) ~err:_ ~loss:_ -> `print_err)
    in
    for epoch = 1 to epochs do
      let inputs =
        match batch_size with
        | None -> inputs ~xs ~ys
        | Some batch_size ->
          let offset = ((epoch-1) * batch_size) mod (samples - batch_size) in
          let xs = Tensor.sub_left xs offset batch_size in
          let ys = Tensor.sub_left ys offset batch_size in
          inputs ~xs ~ys
      in
      let err =
        Session.run
          ~inputs
          ~targets:optimizer
          ~session:t.session
          (scalar_f_or_d loss)
      in
      match on_epoch epoch ~err ~loss with
      | `print_err -> printf "Epoch: %6d/%-6d   Loss: %.2f\n%!" epoch epochs err
      | `do_nothing -> ()
    done

let fit = fit_gen Session.Input.float Session.Output.scalar_float
let fit_d = fit_gen Session.Input.double Session.Output.scalar_double

let evaluate_gen input_f_or_d output_f_or_d type_ =
  fun ?named_inputs ?batch_size ?node t xs ->
    let nsamples = (Tensor.dims xs).(0) in
    let nbatchs, batch_size =
      match batch_size with
      | None -> 1, nsamples
      | Some batch_size -> 1 + (nsamples - 1) / batch_size, batch_size
    in
    let node =
      match node with
      | None -> Nn.node t.net
      | Some node -> node
    in
    if nbatchs = 1
    then
      Session.run
        ~inputs:(all_inputs input_f_or_d ?named_inputs t xs)
        ~session:t.session
        (output_f_or_d node)
    else begin
      let dims = Nn.shape t.net |> Nn.Shape.dim_list in
      let ys = Tensor.create type_ (Array.of_list (nsamples :: dims)) in
      for batch_idx = 0 to nbatchs - 1 do
        let samples_idx = batch_idx * batch_size in
        let samples_count = min batch_size (nsamples - samples_idx) in
        let xs = Tensor.sub_left xs samples_idx samples_count in
        let batch_results =
          Session.run
            ~inputs:(all_inputs input_f_or_d ?named_inputs t xs)
            ~session:t.session
            (output_f_or_d node)
        in
        Tensor.blit
          batch_results
          (Tensor.sub_left ys samples_idx samples_count)
      done;
      ys
    end

let evaluate = evaluate_gen Session.Input.float Session.Output.float Float32
let evaluate_d = evaluate_gen Session.Input.double Session.Output.double Float64

(* Collect all variables in a net. The order of the created list is important as it
   will serve to name the variable.
   This does not seem very robust but will do for now. *)
let all_vars_with_names t =
  Var.get_all_vars (Nn.node t.net)
  |> List.mapi ~f:(fun i var -> sprintf "V%d" i, var)

let save t ~filename =
  let save_node =
    Hashtbl.find_or_add t.save_nodes filename ~default:(fun () ->
      Ops.save ~filename (all_vars_with_names t))
  in
  Session.run
    ~session:t.session
    ~targets:[ Node.P save_node ]
    Session.Output.empty

let load t ~filename =
  let load_and_assign_nodes =
    Hashtbl.find_or_add t.load_and_assign_nodes filename ~default:(fun () ->
      let filename = Ops.const_string [ filename ] in
      List.map (all_vars_with_names t) ~f:(fun (var_name, (Node.P var)) ->
        Ops.restore
          ~type_:(Node.output_type var)
          filename
          (Ops.const_string [ var_name ])
        |> Ops.assign var
        |> fun node -> Node.P node))
  in
  Session.run
    ~session:t.session
    ~targets:load_and_assign_nodes
    Session.Output.empty
