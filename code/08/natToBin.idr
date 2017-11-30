import Data.Nat.Views

%default total

data Binary : Nat -> Type where
   BEnd : Binary Z
   BO : Binary n -> Binary (n + n)
   BI : Binary n -> Binary (S (n + n))

                        
natToBinV : (n:Nat) -> Binary n
natToBinV n with (halfRec n)
  natToBinV Z | HalfRecZ = BEnd
  natToBinV (x + x) | (HalfRecEven rec) 
                = BO (natToBinV x | rec)
  natToBinV (S (x + x)) | (HalfRecOdd rec) 
                = BI (natToBinV x | rec)

Show (Binary n) where
    show BEnd = "0"
    show b = showRec b ""
      where
        showRec : Binary n -> String -> String
        showRec BEnd s = s
        showRec (BO x) s = showRec x (strCons '0' s)
        showRec (BI x) s = showRec x (strCons '1' s)

main : IO ()
main = do 
  printLn (natToBinV 0)
  printLn (natToBinV 1)
  printLn (natToBinV 2)
  printLn (natToBinV 5)
  printLn (natToBinV 8)
