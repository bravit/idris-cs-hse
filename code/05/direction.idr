data Direction = North | East | South | West

Eq Direction where
  North == North = True
  East == East = True
  South == South = True
  West == West = True
  _ == _ = False
  
Ord Direction where
  compare a b = 
    if a == b then EQ 
    else 
      case a of
        North => LT
        West => GT
        East => if b == North then GT else LT
        South => if b == West then LT else GT
  
MinBound Direction where
  minBound = North
  
MaxBound Direction where
  maxBound = West
  
Enum Direction where
  toNat North = 0
  toNat East = 1
  toNat South = 2
  toNat West = 3

  fromNat Z = North
  fromNat (S Z) = East
  fromNat (S (S Z)) = South
  fromNat (S (S (S Z))) = West 
  fromNat _ = West
  
  pred West = South
  pred South = East
  pred East = North
  pred North = North

interface (Eq t, Enum t) => AAA t where
  f : t -> Bool 
  f a = a == a 


interface (Eq t, Enum t, MinBound t, MaxBound t) => CEnum t where
  cpred : t -> t
  cpred a = if a == minBound then maxBound else pred a
  
  csucc : t -> t
  csucc a = if a == maxBound then minBound else succ a

CEnum Direction where
