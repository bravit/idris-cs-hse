sumN : Integer -> Integer
sumN 0 = 0
sumN n = n + sumN (n-1)

sumN' : Integer -> Integer
sumN' 0 = 0
sumN' n = go 0 n
  where  
  go s 0 = s
  go s i = go (s+i) (i-1)    
