AdderType : (numargs : Nat) -> Type -> Type
AdderType Z t = t
AdderType (S k) t = t -> AdderType k t

adder : Num nt => (numargs : Nat) -> nt
                  -> AdderType numargs nt
adder Z acc = acc
adder (S k) acc = \next => adder k (next + acc)
