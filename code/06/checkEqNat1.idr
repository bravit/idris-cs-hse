import Data.Vect

data EqNat : (num1 : Nat) -> (num2 : Nat) -> Type where
  Same : (num : Nat) -> EqNat num num

checkEqNat : (num1 : Nat) -> (num2 : Nat) -> 
             Maybe (EqNat num1 num2)
checkEqNat Z Z = Just (Same 0)
checkEqNat Z (S k) = Nothing
checkEqNat (S k) Z = Nothing
checkEqNat (S k) (S j) = 
     case checkEqNat k j of
       Nothing => Nothing
       Just (Same j) => Just (Same (S j))



exactLength' : (len : Nat) -> Vect m a ->
                              Maybe (Vect len a)
exactLength' {m} len xs = 
  case checkEqNat len m of
     Nothing => Nothing
     (Just (Same m)) => Just xs
