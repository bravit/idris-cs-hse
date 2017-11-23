import Data.Vect

readVectLen : (len : Nat) -> IO (Vect len String)
readVectLen Z = pure []
readVectLen (S k) = do s <- getLine
                       ss <- readVectLen k
                       pure (s :: ss)

readVect : IO (len : Nat ** Vect len String)
readVect = do s <- getLine
              if s == ""
                then pure (_ ** [])
                else do (_ ** ss) <- readVect
                        pure (_ ** s :: ss)

zipInputs : IO ()
zipInputs = do 
   (l1 ** v1) <- readVect
   (l2 ** v2) <- readVect
   case exactLength l1 v2 of 
      Nothing => putStrLn ("Error")
      Just x => printLn (zip v1 x)
