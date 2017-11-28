import Data.Vect

%hide isElem

not_in_nil : Elem v [] -> Void
not_in_nil Here impossible
not_in_nil (There _) impossible

not_in_tail : (contra : (v = x) -> Void) 
              -> (contra1 : Elem v xs -> Void) 
              -> Elem v (x :: xs) -> Void
not_in_tail contra contra1 Here = contra Refl
not_in_tail contra contra1 (There later) = contra1 later

isElem : DecEq a => (v : a) -> (xs : Vect n a) 
                 -> Dec (Elem v xs)
isElem v [] = No not_in_nil
isElem v (x :: xs) = 
    case decEq v x of
      Yes prf => Yes (rewrite prf in Here)
      No contra => 
          case isElem v xs of
            Yes prf => Yes (There prf)
            No contra1 => No (not_in_tail contra contra1)
