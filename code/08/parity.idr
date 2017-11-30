data Parity : Nat -> Type where
   Even : Parity (n + n)
   Odd  : Parity (S (n + n))

parity : (n : Nat) -> Parity n
parity Z = Even {n = Z}
parity (S Z) = Odd {n = Z}
parity (S (S k)) with (parity k)
  parity (S (S (n + n))) | Even = 
     rewrite plusSuccRightSucc n n 
     in Even {n = S n}
  parity (S (S (S (n + n)))) | Odd = 
     rewrite plusSuccRightSucc n n 
     in Odd {n = S n}
