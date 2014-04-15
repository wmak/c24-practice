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

(* Write a procedure that returns the sum of all elements in the input list. *)

(* use fold *)
fun three(l) = foldr (fn (a, v) => a+v) 0 l;

three: int list -> int;

three([1,3,5,7,9]);

(* use apply *)
(* the apply in SML works differently than it does in scheme *)

(* Write a procedure (filter f l) that returns a list of elements of l that
* satisfy f. *)
fun five f l = foldr (fn (la, v) => if (f la) then la::v else v) [] l;

five: ('Z -> bool) -> 'Z list -> 'Z list;

five (fn x => x = 0) [1,2,3,0];
