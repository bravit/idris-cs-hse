describeList : List Int -> String
describeList [] = "Empty"
describeList (x :: xs) = 
         "Non-empty, tail = " ++ show xs



data ListLast : List a -> Type where
     Empty : ListLast []
     NonEmpty : (xs : List a) -> (x : a) ->
                ListLast (xs ++ [x])

listLast : (xs : List a) -> ListLast xs
listLast [] = Empty
listLast (x :: xs) = 
   case listLast xs of
     Empty => NonEmpty [] x
     NonEmpty xs y => NonEmpty (x :: xs) y

describeHelper : (input : List Int) -> ListLast input -> String
describeHelper [] Empty = "Empty"
describeHelper (xs ++ [x]) (NonEmpty xs x)
               = "Non-empty, initial part = " ++ show xs

describeListEnd : List Int -> String
describeListEnd xs = describeHelper xs (listLast xs)


describeListEnd2 : List Int -> String
describeListEnd2 xs with (listLast xs)
  describeListEnd2 [] | Empty = "Empty"
  describeListEnd2 (ys ++ [x]) | (NonEmpty ys x) = 
             "Non-empty, initial part = " ++ show ys
