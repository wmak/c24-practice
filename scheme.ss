#lang scheme
;Write a procedure that, given a list of non-empty lists, returns the list of
;first elements of the sub-lists.

(define (one L)
	(map first L)
)

;Write a procedure that, given a list of non-empty lists, returns the list of
;ﬁrst elements of the sub-lists.

(define (two L)
	(foldr
		(lambda (y x)
			(cons (first y) x)
		)
	'() L)
)

;Write a procedure that returns the sum of all elements in the input list. 

(define (three L)
	(foldr + 0 (flatten L))
)

;Write a procedure that returns the sum of all elements in the input list. 

(define (four L)
	(apply + (flatten L))
)

;Write a procedure (filter f l) that returns a list of elements of l that
;satisfy f

(define (filter f l)
	(foldr
		(lambda (y x)
			(if (f y)
				(cons y x)
				x
			)
		)
	'() l)
)

;Write a procedure that counts the number of elements in the list, on any
;nesting level.

(define (five L)
	(length (flatten L))
)

;Rewrite the above using fold

(define (six L)
	(foldr
		(lambda (x y) (+ 1 y)) 
		0
		(flatten L)
	)
)

;Write a procedure that returns a list of elements from the input list, on any
;nesting level. That is, it
;
;“ﬂattens” the list. Which, if any, higher-order procedures would you like to
;use here? flattens.

(define (seven L)
	(if (empty? L)
		'()
		(if (list? (first L))
			(append (seven (first L)) (seven (rest L)))
			(cons (first L) (seven (rest L)))
		)
	)
)

;TAIL RECURSION
(define (eight L)
	(helper '() L)
)

(define (helper accum L)
	(if (empty? L)
		accum
		(if (list? (first L))
			(append accum (helper accum (first L))) 
			(helper (cons accum (list (first L))) (rest L))
		)
	)
)

(display (one '((1 2 3) (2 3 4))))
(display "\n")
(display (two '((1 2 3) (2 3 4))))
(display "\n")
(display (three '((1 2 3) (2 3 4))))
(display "\n")
(display (four '((1 2 3) (2 3 4))))
(display "\n")
(display (filter list? '((1 2 3) 2)))
(display "\n")
(display (five '((1 2 3) (2 3 4))))
(display "\n")
(display (six '((1 2 3) (2 3 4))))
(display "\n")
(display (seven '((1 2 3) (2 3 4))))
(display "\n")
(display (eight '((1 2 3) (2 3 4))))
