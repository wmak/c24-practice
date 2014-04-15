(* sml practice for cscc24 exam *)

(* Write a procedure that given a list of non-empty lists, returns the list of
 * first elements of the sub-lists *)

(* use map *)
fun one(l) = map hd l;

one: 'a list list -> 'a list;

one([[1,2,3],[2,3,4]]);

(* use fold *)
fun two(l) = foldr (fn (la, v) => (hd la)::v) [] l;

two: 'a list list -> 'a list;

two([[1,2,3],[2,3,4]]);
