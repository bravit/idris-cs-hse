import Data.Vect

insert : Ord a => (x : a) -> 
                  (xsSorted : Vect len a) -> 
                  Vect (S len) a
insert x [] = [x]
insert x (y :: xs) = 
   if x < y then x :: y :: xs
   else (y :: insert x xs)

inssort : Ord a => Vect n a -> Vect n a
inssort [] = []
inssort (x :: xs) = 
  let xsSorted = inssort xs
  in insert x xsSorted
