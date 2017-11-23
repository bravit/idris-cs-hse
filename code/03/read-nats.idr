import Data.String

parseNat : String -> Maybe Nat
parseNat = parsePositive

readNat : IO (Maybe Nat)
readNat = do 
   s <- getLine
   case parseNat s of
     Nothing => pure Nothing
     Just x => pure (Just x)
