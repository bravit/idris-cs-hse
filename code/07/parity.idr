-- 0

data Parity' = Even' | Odd'

parity' : (n : Nat) -> Parity'
parity' Z = Even'
parity' (S Z) = Odd'
parity' (S (S k)) = parity' k

-- 1

data Parity : Nat -> Type where
   Even : Parity (n + n)
   Odd  : Parity (S (n + n))

parity : (n : Nat) -> Parity n
parity Z = Even {n = Z}
parity (S Z) = Odd {n = Z}
parity (S (S k)) = 
  case parity k of
    Even {n} => 
       rewrite plusSuccRightSucc n n 
       in Even {n = S n}
    Odd {n} => 
       rewrite plusSuccRightSucc n n 
       in Odd {n = S n}

-- 2

data Digit = I | O

natToBinH : Nat -> List Digit
natToBinH Z = []
natToBinH (S k) = 
  case parity k of 
    Even {n} => I :: natToBinH n
    Odd  {n} => O :: natToBinH (S n)

natToBin : Nat -> List Digit
natToBin Z = [O]
natToBin k = reverse (natToBinH k)

-- 3 

data Binary : Nat -> Type where
   BEnd : Binary Z
   BO : Binary n -> Binary (n + n)
   BI : Binary n -> Binary (S (n + n))

                        
natToBinV : (n:Nat) -> Binary n
natToBinV Z = BEnd
natToBinV k = 
  case parity k of
    Even{n} => BO (natToBinV n)
    Odd {n} => BI (natToBinV n)


natToBinV2 : (n:Nat) -> Binary n
natToBinV2 Z = BEnd
natToBinV2 k with (parity k)
  natToBinV2 (n + n) | Even = BO (natToBinV n) 
  natToBinV2 (S (n + n)) | Odd = BI (natToBinV n) 

-- 4  

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
  putStr "Enter a number: "
  x <- getLine
  print (natToBinV (cast x))
