import Data.Vect

rotate : Vect n a -> Vect n a
rotate [] = []
rotate (x :: xs) = insLast x xs
  where
    insLast : a -> Vect k a -> Vect (S k) a
    insLast x [] = [x]
    insLast x (y :: xs) = y :: insLast x xs
