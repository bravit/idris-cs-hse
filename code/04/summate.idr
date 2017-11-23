summate : Int -> String -> Maybe (String, Int)
summate s y = 
   case the Int (cast y) of
     0 => Nothing
     n => let s' = s + n 
          in Just ("Sum=" ++ cast s' ++ "\n", s')

main : IO ()
main = replWith 0 "> " summate
