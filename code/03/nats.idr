%hide Nat

data Nat : Type where
  Z : Nat
  S : Nat -> Nat

n0 : Nat
n0 = Z

n2 : Nat
n2 = S (S Z)

n5 : Nat
n5 = S(S(S(S(S Z))))

prev : Nat -> Nat
prev Z = Z
prev (S x) = x

plus : Nat -> Nat -> Nat
plus Z j = j
plus (S x) j = S (plus x j)

mutual
  odd : Nat -> Bool
  odd Z = False
  odd (S k) = even k

  even : Nat -> Bool
  even Z = True
  even (S k) = odd k

