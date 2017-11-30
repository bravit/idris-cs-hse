module Sorted

import Data.Vect

%access public

data Sorted : (xs : Vect n Nat) -> Type where
  SortedEmpty : Sorted []
  SortedOne : (x : Nat) -> Sorted [x]
  SortedMany : (x : Nat) -> (y : Nat) ->
               Sorted (y :: zs) -> (LTE x y) ->
               Sorted (x :: y :: zs)

%name Sorted sp,sp1,sp2

sortedVec12 : Sorted [1,2]
sortedVec12 = SortedMany 1 2 (SortedOne 2) (LTESucc LTEZero)

sortedVec123 : Sorted [0,1,2]
sortedVec123 = SortedMany _ _ sortedVec12 LTEZero


headsNotSorted : (contra : LTE x y -> Void) -> Sorted (x :: (y :: xs)) -> Void
headsNotSorted contra (SortedMany x y sp pf) = contra pf

tailNotSorted : (contra : Sorted (y :: xs) -> Void) -> (prf : LTE x y) -> Sorted (x :: (y :: xs)) -> Void
tailNotSorted contra prf (SortedMany x y sp pf) = contra sp

isSorted : (xs : Vect n Nat) -> Dec (Sorted xs)
isSorted [] = Yes SortedEmpty
isSorted (x :: []) = Yes (SortedOne x)
isSorted (x :: (y :: xs)) = 
    case isLTE x y of
      (Yes prf1) => (case isSorted (y :: xs) of
                         (Yes prf2) => 
                           Yes (SortedMany x y prf2 prf1)
                         (No contra) => No (tailNotSorted contra prf1))
      (No contra) => No (headsNotSorted contra)
