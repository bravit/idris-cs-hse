%hide LTE
%hide GTE
%hide LT
%hide GT
%hide isLTE
%hide Not

Not : Type -> Type
Not a = a -> Void


data LTE  : (n, m : Nat) -> Type where
  LTEZero : LTE Z    right
  LTESucc : LTE left right -> LTE (S left) (S right)

GTE : Nat -> Nat -> Type
GTE left right = LTE right left

LT : Nat -> Nat -> Type
LT left right = LTE (S left) right

GT : Nat -> Nat -> Type
GT left right = LT right left

isLTE : (m, n : Nat) -> Dec (m `LTE` n)

