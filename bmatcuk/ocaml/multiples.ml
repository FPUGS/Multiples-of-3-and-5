(* multiples.ml *)

(* Find the sum of all multiples of 3 and 5 from a range of numbers. *)

open Printf;;

let sum ~start ~stop =
  let rec summer = function
    | i when i == stop -> 0
    | i when i mod 3 == 0 || i mod 5 == 0 -> i + summer (i + 1)
    | i -> summer (i + 1) in
  match start < stop with
  | true -> summer start
  | false -> 0;;

let run (start, stop) =
  printf "The sum of all multiples of 3 and 5 from %d to %d is %d\n" start stop (sum start stop);;

let main () =
  let tests = [
    (1, 10);
    (1, 1000)
  ] in
  List.iter run tests;
  exit 0;;
main ();;

