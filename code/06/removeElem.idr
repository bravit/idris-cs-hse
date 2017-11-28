import Data.Vect

removeElem : DecEq a => (v : a) -> (xs : Vect (S n) a) 
             -> Elem v xs -> Vect n a
removeElem v (v :: ys) Here = ys
removeElem {n = Z} _ _ (There _) impossible 
removeElem {n = (S k)} v (y :: ys) (There later) = y :: removeElem v ys later

removeElem_auto : DecEq a => (v : a) -> (xs : Vect (S n) a) 
             -> {auto prf : Elem v xs} -> Vect n a
removeElem_auto v xs {prf} = removeElem v xs prf
