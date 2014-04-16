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

(*Trees!*)
datatype 'a NonEmptyTree = Node of 'a * ('a NonEmptyTree list);

fun numLeaves (Node(_, [])) = 1
  | numLeaves (Node(_, [a])) = numLeaves(a)
  | numLeaves (Node(x, (a::b))) = numLeaves(a) + numLeaves(Node(x, b));

numLeaves : 'a NonEmptyTree -> int;

val tree = (Node(1, [(Node(1,[])), (Node(2,[])), (Node(3,[(Node(1,[])),
(Node(2,[]))]))]));

numLeaves(tree);

fun numNodes (Node(_, [])) = 1
  | numNodes (Node(_, [a])) = 1 + numNodes(a)
  | numNodes (Node(x, (a::b))) = numNodes(a) + numNodes(Node(x, b));

numNodes : 'a NonEmptyTree -> int;

numNodes(tree);

fun height (Node(_, [])) = 0
  | height (Node(_, [a])) = 1 + height(a)
  | height (Node(x, (a::b))) = (fn (x, y) => if x>y then x else y) (height(a),
  height(Node(x, b)));

height : 'a NonEmptyTree -> int;

height(tree);

fun tmap f (Node(x, [])) = (Node((f x), []))
  | tmap f (Node(x, [a])) = (Node((f x),tmap f a))
  | tmap f (Node(x, (a::b))) = (Node((f x), (tmap f a) :: (tmap f (Node(x,b)))));

height : ('a -> 'b) -> 'a NonEmptyTree -> 'b NonEmptyTree;
