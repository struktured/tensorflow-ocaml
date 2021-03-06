(* See http://colah.github.io/posts/2015-08-Understanding-LSTMs
   for a simple description of LSTM networks.
*)
open Core_kernel.Std

let lstm_ ~type_ ~size_c ~size_x =
  let create_vars () =
    Var.normal ~type_ [ size_c+size_x; size_c ] ~stddev:0.1,
    Var.f_or_d [ size_c ] 0. ~type_
  in
  let wf, bf = create_vars () in
  let wi, bi = create_vars () in
  let wC, bC = create_vars () in
  let wo, bo = create_vars () in
  Staged.stage (fun ~h ~x ~c ->
    let open Ops in
    let h_and_x = concat one32 [ h; x ] in
    let c =
      sigmoid (h_and_x *^ wf + bf) * c
      + sigmoid (h_and_x *^ wi + bi) * tanh (sigmoid (h_and_x *^ wC + bC))
    in
    let h = sigmoid (h_and_x *^ wo + bo) * tanh c in
    `h h, `c c)

let lstm ~size_c ~size_x = lstm_ ~type_:Float ~size_c ~size_x
let lstm_d ~size_c ~size_x = lstm_ ~type_:Double ~size_c ~size_x

let gru_ ~type_ ~size_h ~size_x =
  let create_vars () =
    Var.normal ~type_ [ size_h+size_x; size_h ] ~stddev:0.1,
    Var.f_or_d ~type_ [ size_h ] 0.
  in
  (* The reset parameters *)
  let wr, br = create_vars () in
  (* The mixing variables *)
  let wz, bz = create_vars () in
  (* The contribution of x and the resetted old state *)
  let wH, bH = create_vars () in
  Staged.stage (fun ~h ~x ->
    let open Ops in
    let h_and_x = concat one32 [ h; x ] in
    (* h partly reseted reset h *)
    let rh = sigmoid (h_and_x *^ wr + br) * h in
    let rh_and_x = concat one32 [ rh; x ] in
    (* the new value of h *)
    let nh = tanh (rh_and_x *^ wH + bH) in
    (* How do we mix th new h and the old h *)
    let z = sigmoid (h_and_x *^ wz + bz) in
    (* we mix the old h and the new h *)
    z * nh + (f_or_d ~type_ 1.0 - z) * h)

let gru ~size_h ~size_x = gru_ ~type_:Float ~size_h ~size_x
let gru_d ~size_h ~size_x = gru_ ~type_:Double ~size_h ~size_x
