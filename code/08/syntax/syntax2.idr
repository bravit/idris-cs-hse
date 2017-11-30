syntax [var] ":=" [val]                = Assign var val
syntax [test] "?" [t] ":" [e]          = if test then t else e
syntax select [x] from [t] "where" [w] = SelectWhere x t w
syntax select [x] from [t]             = Select x t



syntax for {x} "in" [xs] ":" [body] = for xs (\x => body)

main : IO ()
main = do for x in [1..10]:
              do {putStr ("Number " ++ show x); putStrLn ""}
          putStrLn "Done!"
