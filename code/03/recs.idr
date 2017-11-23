import Data.Vect

record Person where
    constructor MkPerson
    firstName, middleName, lastName : String
    age : Int

fred : Person
fred = MkPerson "Fred" "Joe" "Bloggs" 30

record Prod a b where
    constructor Times
    fst : a
    snd : b


record SizedClass (size : Nat) where
    constructor SizedClassInfo
    students : Vect size Person
    className : String

addStudent : Person -> SizedClass n 
                    -> SizedClass (S n)
addStudent p c = SizedClassInfo (p :: students c) 
                                (className c)
