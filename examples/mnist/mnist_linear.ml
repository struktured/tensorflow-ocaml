open Core_kernel.Std
module O = Ops

let train_size = 1000
let validation_size = 1000
let image_dim = Mnist.image_dim
let label_count = Mnist.label_count
let epochs = 1000

let () =
  let { Mnist.train_images; train_labels; validation_images; validation_labels } =
    Mnist.read_files ~train_size ~validation_size ()
  in
  let xs = O.placeholder [] ~type_:Float in
  let ys = O.placeholder [] ~type_:Float in
  let w = Var.f [ image_dim; label_count ] 0. in
  let b = Var.f [ label_count ] 0. in
  let ys_ = O.(xs *^ w + b) |> O.softmax in
  let cross_entropy = O.(neg (reduce_sum (ys * log ys_))) in
  let accuracy =
    O.(equal (argMax ys_ O.one32) (argMax ys O.one32))
    |> O.cast ~type_:Float
    |> O.reduce_mean
  in
  let gd =
    Optimizers.gradient_descent_minimizer ~alpha:(O.f 0.0001) ~varsf:[ w; b ]
      cross_entropy
  in
  let train_inputs = Session.Input.[ float xs train_images; float ys train_labels ] in
  let validation_inputs =
    Session.Input.[ float xs validation_images; float ys validation_labels ]
  in
  let print_err n =
    let accuracy =
      Session.run
        ~inputs:validation_inputs
        (Session.Output.scalar_float accuracy)
    in
    printf "epoch %d, accuracy %.2f%%\n%!" n (100. *. accuracy)
  in
  for i = 1 to epochs do
    if i % 100 = 0 then print_err i;
    Session.run
      ~inputs:train_inputs
      ~targets:gd
      Session.Output.empty;
  done
