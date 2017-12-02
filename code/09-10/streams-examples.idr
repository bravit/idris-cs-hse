%hide iterate
%hide take
%hide map

iterate : (a -> a) -> a -> Stream a
iterate f x = x :: iterate f (f x)

nats : Stream Nat
nats = iterate (+1) 0

take : (n : Nat) -> (xs : Stream a) -> List a
take Z _ = []
take (S n) (x :: xs) = x :: take n xs

map : (a -> b) -> (Stream a) -> Stream b
map f (x :: xs) = f x :: map f xs

fibs : Stream Nat
fibs = map fst (iterate next (0,1,1))
  where 
    next : (Nat, Nat, Nat) -> (Nat, Nat, Nat) 
    next (_, a, b) = (a, b, a+b)
    fst : (Nat, Nat, Nat) -> Nat
    fst (a, _, _) = a

fibs' : Stream Nat
fibs' = 0 :: 1 :: zipWith (+) fibs' (tail fibs')
