%hide replace

cong : {f : a -> b} -> x = y -> f x = f y
cong Refl = Refl

sym : x = y -> y = x
sym Refl = Refl

replace : {P : a -> Type} -> x = y -> P x -> P y
replace Refl pf = pf

cong' : {f : a -> b} -> x = y -> f x = f y
cong' {f} {x} eq = replace {P = \t => f x = f t} eq Refl

sym' : x = y -> y = x
sym' {x} eq = replace {P = \t => t = x } eq Refl

