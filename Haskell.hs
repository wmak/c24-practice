module Haskell where

{- Write a procedure that, given a list of non-empty lists, returns the list of
 - ﬁrst elements of the sub-lists -}

{- Use map -}
one l = map head l
one :: [[a]] -> [a]

{- Use fold -}
two l = foldr (\x y -> take 1 x ++ y) [] l
two :: [[a]] -> [a]

{- Write a procedure that returns the sum of all elements in the input list. -}

{- Use fold -}
three l = foldr (\x y -> x + y) 0 l
three :: [Int] -> Int

{- Use apply -}
{- four Not applicable in Haskell -}

{-  Write a procedure (filter f l) that returns a list of elements of l that
 -  satisfy f -}
five f l = foldr (\x y -> if (f x) then [x] ++ y else y) [] l
five :: (a -> Bool) -> [a] -> [a]

{- The rest of the questions cannot be done with haskell -}

{- Deﬁne a function double which returns [2*a0, 2*a1, 2*a2, ...] when called
 - with an input list
 -
 - [a0, a1, a2, ...]. What is the type of double?
 -}
double l = [2*x | x <- l]
double :: [Double] -> [Double]

{- Deﬁne the function expTaylor x which returns a list, so that summing this
 - list gives the above series. -}
expTaylor x = [x**i/(factorial i) | i <- [1..]]
expTaylor :: Double -> [Double]

factorial n = if n == 0 then 1 else n * factorial (n - 1)
