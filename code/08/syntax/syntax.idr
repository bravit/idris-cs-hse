syntax CALL [f] ON [t] WITH [a] = f t a;

g : Int -> Int -> IO ()
g a b = printLn $ a + b

h : String -> Bool -> IO ()
h s False = printLn s
h s True = printLn ""

main : IO ()
main = do
    CALL g ON 10 WITH 5
    CALL g ON 1 WITH 3
    CALL h ON "QQ" WITH False

