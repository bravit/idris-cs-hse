%default total

data InfIO : Type where
     Do : IO a -> (a -> Inf InfIO) -> InfIO

loopPrint : String -> InfIO
loopPrint msg = Do (putStrLn msg) 
                   (\_ => loopPrint msg)

data More = M (Lazy More)

partial
run2 : InfIO -> IO ()
run2 (Do c f) = 
  do 
    res <- c
    run2 (f res) 


run : More -> InfIO -> IO ()
run (M more) (Do c f) = 
   do res <- c
      run more (f res)

partial
forever : More
forever = M forever

partial
main : IO ()
main = run forever (loopPrint "hi!")
