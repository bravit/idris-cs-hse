import Data.Vect

exactLength : (len : Nat) -> Vect m a -> Maybe (Vect len a)
exactLength {m} len xs = 
  if m == len 
    then Just ?exactLength_rhs
    else Nothing
