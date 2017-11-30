%default total

plus_Z : (n : Nat) -> n = plus n Z
plus_Z Z = Refl
plus_Z (S k) = cong (plus_Z k)

plus_S : (n, k : Nat) -> S (plus n k) = plus n (S k)
plus_S Z k = Refl
plus_S (S j) k = cong (plus_S j k)

plusComm : (m, n : Nat) -> plus m n = plus n m
plusComm Z n = plus_Z n
plusComm (S k) n = 
  let
    ih = plusComm k n
    lem = plus_S n k
  in replace {P = \r => S r = plus n (S k)} (sym ih) lem

plusComm2 : (m, n : Nat) -> plus m n = plus n m
plusComm2 Z n = plus_Z n
plusComm2 (S k) n = 
  rewrite plusComm2 k n in plus_S n k
