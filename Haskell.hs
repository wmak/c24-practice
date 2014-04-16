module Haskell where

{- Deﬁne a function double which returns [2*a0, 2*a1, 2*a2, ...] when called
 - with an input list
 -
 - [a0, a1, a2, ...]. What is the type of double?
 -}
double l = [2*x | x <- l]
double :: [Double] -> [Double]
