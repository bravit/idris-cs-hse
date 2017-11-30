(>>=) : String -> (String -> List String) -> List String
(>>=) n f = n :: f ""

sum : List String
sum = do 
        "15"
        "10"
        "5"
        []

syntax END = []

sum2 : List String
sum2 = do
         "10"
         "20"
         "30"
         END
