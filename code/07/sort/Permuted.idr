module Permuted

import Data.Vect

%access public

data Permuted : (xs : Vect n Nat) -> 
                (ys : Vect n Nat) -> Type where
    NilIsNil : 
        Permuted Nil Nil
    PrependXIsPrependX :
        (x : Nat) -> Permuted zs zs' ->
        Permuted (x :: zs) (x :: zs')
    PrependXYIsPrependYX :
        (x : Nat) -> (y : Nat) -> Permuted zs zs' ->
        Permuted (x :: y :: zs) ( y:: x :: zs')
    IsTransitive :
        Permuted xs zs -> Permuted zs ys ->
        Permuted xs ys
