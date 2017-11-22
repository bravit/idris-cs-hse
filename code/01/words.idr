module Main

average : (str : String) -> Double
average str = let num_words = word_count str
                  total_length = sum (word_lengths (words str)) 
              in cast total_length / cast num_words
  where
    word_count : String -> Nat
    word_count str = length (words str)

    word_lengths : List String -> List Nat
    word_lengths strs = map length strs

showAverage : String -> String
showAverage str = "The average word length is: " ++
                  show (average str) ++ "\n"

main : IO ()
main = repl "Enter a string: " showAverage
