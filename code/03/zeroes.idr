import Data.Vect

zeroes : Vect n Nat
zeroes {n = Z} = []
zeroes {n = (S k)} = 0 :: zeroes


v : Vect 10 Nat
v = zeroes
