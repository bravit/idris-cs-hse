import Data.Vect

rotate : Vect n a -> Vect n a
rotate [] = []
rotate (x :: xs) = rotateProof (xs ++ [x])
  where
    rotateProof : Vect (len + 1) a -> Vect (S len) a
    rotateProof {len} xs = 
--      replace {P = \n => Vect n a} (plusCommutative len 1) xs
      rewrite plusCommutative 1 len in xs
