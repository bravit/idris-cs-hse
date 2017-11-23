data Ty = TyNat | TyBool | TyString

evalType : Ty -> Type
evalType TyNat = Nat
evalType TyBool = Bool
evalType TyString = String

defaultVal : (ty : Ty) -> evalType ty
defaultVal TyNat = 0
defaultVal TyBool = False
defaultVal TyString = ""

showNat : Nat -> String
showNat Z = "z"
showNat (S k) = "s" ++ showNat k

showBool : Bool -> String
showBool False = "f"
showBool True = "t"

toString : (ty : Ty) -> evalType ty -> String
toString TyNat x = showNat x
toString TyBool x = showBool x
toString TyString x = x

fromMaybeTy : (ty : Ty) -> Maybe (evalType ty)
              -> evalType ty
fromMaybeTy ty Nothing = defaultVal ty
fromMaybeTy _ (Just x) = x

fromMaybeTy' : (ty : Ty) -> 
                let t = evalType ty in Maybe t -> t
fromMaybeTy' = fromMaybeTy

defaultVal' : (ty : Ty) -> case ty of
                             TyNat => Nat
                             TyBool => Bool
                             TyString => String
defaultVal' TyNat = 0
defaultVal' TyBool = False
defaultVal' TyString = ""
