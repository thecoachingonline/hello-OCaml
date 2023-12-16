#require "lattices.ml";;

let encode_hello_world () =
  let m = "สวัสดีชาวโลก" in
  let v = Vector.of_string m in
  let g = generate_generator (4096) in
  let lwe = LWE.encrypt (g, v) in
  lwe;;

let decode_hello_world (lwe) =
  let (g, v) = LWE.decrypt lwe in
  let m = Vector.to_string v in
  m;;

let () =
  let lwe = encode_hello_world () in
  let m = decode_hello_world lwe in
  print_endline m;;
