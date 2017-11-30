(>>=) : String -> (String -> String) -> String
(>>=) n f = n ++ f ""

sum : String
sum = do 
        "15"
        "10"
