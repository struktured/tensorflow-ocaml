open Core_kernel.Std
open Node

module Placeholder = struct
  type nonrec 'a t = 'a t
  let to_node = Fn.id
end

let get_shape ?shape values =
  match shape with
  | Some shape ->
    let vs = List.fold shape ~init:1 ~f:( * ) in
    let len = List.length values in
    if vs <> len
    then raise (Invalid_argument (sprintf "Input length mismatch %d <> %d" vs len));
    shape
  | None -> [ List.length values ]

let const_float
    ?(name = "Const")
    ?shape
    ~type_
    values
  =
  let shape = get_shape ?shape values in
  Node.create
    ~name:(Name.of_string name)
    ~op_name:(Op_name.of_string "Const")
    ~output_type:type_
    ~inputs:[]
    ~attributes:[
      "dtype", Type (P type_);
      "value", Tensor_float { type_ = P type_; shape; values };
    ]
    ~output_idx:None

let const_int
    ?(name = "Const")
    ?shape
    ~type_
    values
  =
  let shape = get_shape ?shape values in
  Node.create
    ~name:(Name.of_string name)
    ~op_name:(Op_name.of_string "Const")
    ~output_type:type_
    ~inputs:[]
    ~attributes:[
      "dtype", Type (P type_);
      "value", Tensor_int { type_ = P type_; shape; values };
    ]
    ~output_idx:None

let const_string
    ?(name = "Const")
    ?shape
    values
  =
  let shape = get_shape ?shape values in
  Node.create
    ~name:(Name.of_string name)
    ~op_name:(Op_name.of_string "Const")
    ~output_type:String
    ~inputs:[]
    ~attributes:[
      "dtype", Type (P String);
      "value", Tensor_string { type_ = P String; shape; values };
    ]
    ~output_idx:None

let scalar ?empty_shape ~type_ f =
  const_float
    ~type_
    ~shape:(if Option.is_some empty_shape then [] else [ 1 ])
    [ f ]

type 't b =  ?name:string -> 't Node.t -> 't Node.t -> 't Node.t

let (+) = Ops_generated.add
let (-) = Ops_generated.sub
let ( * ) = Ops_generated.mul
let ( *^ ) = Ops_generated.matMul ~transpose_a:false ~transpose_b:false
let (/) = Ops_generated.div

let f_or_d ?shape ~type_ x =
  let scalar = const_float ~type_ ~shape:[] [ x ] in
  match shape with
  | None -> scalar
  | Some dims -> Ops_generated.fill (const_int ~type_:Int32 dims) scalar

let f ?shape x = f_or_d ?shape ~type_:Float x
let d ?shape x = f_or_d ?shape ~type_:Double x

let cf ?shape x = const_float ?shape ~type_:Float x
let cd ?shape x = const_float ?shape ~type_:Double x

let zero32 = const_int ~shape:[] ~type_:Int32 [ 0 ]
let one32 = const_int ~shape:[] ~type_:Int32 [ 1 ]
let two32 = const_int ~shape:[] ~type_:Int32 [ 2 ]
let three32 = const_int ~shape:[] ~type_:Int32 [ 3 ]
let four32 = const_int ~shape:[] ~type_:Int32 [ 4 ]

let range node = Ops_generated.range zero32 node one32

let reduce_op op ?dims node =
  let dims =
    match dims with
    | Some dims -> const_int ~type_:Int32 dims
    | None -> Ops_generated.range zero32 (Ops_generated.rank node) one32
  in
  op node dims

type 'a reduce_fn
   =  ?dims:int list
  -> ([< `complex64 | `double | `float | `int32 | `int64 ] as 'a) Node.t
  -> 'a Node.t

let reduce_sum ?dims node = reduce_op Ops_generated.sum ?dims node
let reduce_mean ?dims node = reduce_op Ops_generated.mean ?dims node
let reduce_min ?dims node = reduce_op Ops_generated.min ?dims node
let reduce_max ?dims node = reduce_op Ops_generated.max ?dims node
let reduce_prod ?dims node = reduce_op Ops_generated.prod ?dims node
let reduce_all ?dims node = reduce_op Ops_generated.all ?dims node
let reduce_any ?dims node = reduce_op Ops_generated.any ?dims node

let placeholder ?name ~type_ shape =
  Ops_generated.placeholder
    ?name
    ~type_
    ~shape:(List.map shape ~f:(fun size -> { Node.Dim.name = None; size }))
    ()

let dropout node ~keep_prob =
  let type_ = Node.output_type node in
  (keep_prob + Ops_generated.randomUniform ~type_ (Ops_generated.shape node))
  |> Ops_generated.floor
  |> fun binary_tensor -> node * (Ops_generated.inv keep_prob) * binary_tensor


let save_
    ?(name = "Save")
    filename
    tensor_names
    tensors
  =
  let inputs = Node.P filename :: Node.P tensor_names :: tensors in
  let type_list =
    List.map tensors ~f:(fun (Node.P tensor) -> Node.Type.P (Node.output_type tensor))
  in
  Node.create
    ~name:(Name.of_string name)
    ~op_name:(Op_name.of_string "Save")
    ~output_type:Unit
    ~inputs
    ~attributes:[ "T", List (Type type_list) ]
    ~output_idx:None

let save ~filename named_tensors =
  let tensor_names, tensors = List.unzip named_tensors in
  save_
    (const_string [ filename ])
    (const_string tensor_names)
    tensors

let split2 ?name dim node =
  match Ops_generated.split dim node ?name ~num_split:2 with
  | [ node1; node2 ] -> node1, node2
  | _ -> assert false

let split3 ?name dim node =
  match Ops_generated.split dim node ?name ~num_split:3 with
  | [ node1; node2; node3 ] -> node1, node2, node3
  | _ -> assert false

let split4 ?name dim node =
  match Ops_generated.split dim node ?name ~num_split:4 with
  | [ node1; node2; node3; node4 ] -> node1, node2, node3, node4
  | _ -> assert false

let cast ?name (type a) (type b) (t : a Node.t) ~(type_ : b Node.Type.t) =
  match Node.output_type t, type_ with
  | Node.Type.Float, Node.Type.Float -> (t : b Node.t)
  | _ -> Ops_generated.cast ?name t ~type_
