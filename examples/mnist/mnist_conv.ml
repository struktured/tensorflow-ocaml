open Core_kernel.Std

let train_size = 50000
let batch_size = 500
let validation_size = 1000
let epochs = 5000

let conv2d x w =
  Ops.conv2D x w ~strides:[ 1; 1; 1; 1 ] ~padding:"SAME"

let max_pool_2x2 x =
  Ops.maxPool x ~ksize:[ 1; 2; 2; 1 ] ~strides:[ 1; 2; 2; 1 ] ~padding:"SAME"

let () =
  let { Mnist.train_images; train_labels; validation_images; validation_labels } =
    Mnist.read_files ~train_size ~validation_size ()
  in
  let xs = Ops_m.placeholder [] ~type_:Float in
  let ys = Ops_m.placeholder [] ~type_:Float in

  let x_image = Ops.reshape xs (Ops_m.const_int ~type_:Int32 [ -1; 28; 28; 1 ]) in
  let w_conv1 = Var.normalf [ 5; 5; 1; 32 ] ~stddev:0.1 in
  let b_conv1 = Var.f [ 32 ] 0. in
  let h_conv1 = Ops.add (conv2d x_image w_conv1) b_conv1 in
  let h_pool1 = max_pool_2x2 h_conv1 in

  let w_conv2 = Var.normalf [ 5; 5; 32; 64 ] ~stddev:0.1 in
  let b_conv2 = Var.f [ 64 ] 0. in
  let h_conv2 = Ops.add (conv2d h_pool1 w_conv2) b_conv2 |> Ops.relu in
  let h_pool2 = max_pool_2x2 h_conv2 in

  let w_fc1 = Var.normalf [ 7*7*64; 1024 ] ~stddev:0.1 in
  let b_fc1 = Var.f [ 1024 ] 0. in
  let h_pool2_flat = Ops.reshape h_pool2 (Ops_m.const_int ~type_:Int32 [ -1; 7*7*64 ]) in
  let h_fc1 = Ops.relu Ops_m.(h_pool2_flat *^ w_fc1 + b_fc1) in

  let w_fc2 = Var.normalf [ 1024; 10 ] ~stddev:0.1 in
  let b_fc2 = Var.f [ 10 ] 0. in

  let ys_ = Ops_m.(h_fc1 *^ w_fc2 + b_fc2) |> Ops.softmax in
  let cross_entropy = Ops.neg Ops_m.(reduce_mean (ys * Ops.log ys_)) in
  let accuracy =
    Ops.equal (Ops.argMax ys_ Ops_m.one32) (Ops.argMax ys Ops_m.one32)
    |> Ops.cast ~type_:Float
    |> Ops_m.reduce_mean
  in
  let gd =
    Optimizers.gradient_descent_minimizer ~alpha:0.02
      ~varsf:[ w_conv1; b_conv1; w_conv2; b_conv2; w_fc1; b_fc1; w_fc2; b_fc2 ]
      cross_entropy
  in
  let session = Session.create () in
  let validation_inputs =
    Session.Input.[ float xs validation_images; float ys validation_labels ]
  in
  let print_err n ~train_inputs =
    let vaccuracy =
      Session.run
        session
        ~inputs:validation_inputs
        (Session.Output.scalar_float accuracy)
    in
    let taccuracy =
      Session.run
        session
        ~inputs:train_inputs
        (Session.Output.scalar_float accuracy)
    in
    printf "epoch %d, vaccuracy %.2f%% taccuracy: %.2f%%\n%!" n (100. *. vaccuracy) (100. *. taccuracy)
  in
  for batch_idx = 1 to epochs do
    let start_batch = batch_size * batch_idx in
    (* Stochastic gradient descent... *)
    let start_batch = if start_batch + batch_size >= train_size then 0 else start_batch in
    let batch_images =
      Mnist.slice2 (Bigarray.array2_of_genarray train_images) start_batch batch_size
      |> Bigarray.genarray_of_array2
    in
    let batch_labels =
      Mnist.slice2 (Bigarray.array2_of_genarray train_labels) start_batch batch_size
      |> Bigarray.genarray_of_array2
    in
    let batch_inputs =
      Session.Input.[ float xs batch_images; float ys batch_labels ]
    in
    print_err batch_idx ~train_inputs:batch_inputs;
    Session.run
      session
      ~inputs:batch_inputs
      ~targets:gd
      Session.Output.empty;
  done
