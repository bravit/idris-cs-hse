import Data.Vect

import Sorted
import Permuted

verifiedSort : 
          (xs:Vect n Nat) ->
          (ys:Vect n Nat ** (Sorted ys,
                             Permuted xs ys))
