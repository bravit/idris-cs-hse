import Data.Vect

tryIndex : Integer -> Vect n a -> Maybe a
tryIndex {n = n} i xs = 
    case integerToFin i n of
       Nothing => Nothing
       (Just i') => Just (index i' xs)
