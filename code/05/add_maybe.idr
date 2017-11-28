m_add : Maybe Nat -> Maybe Nat -> Maybe Nat
m_add (Just n) (Just m) = Just (n + m)
m_add _ _ = Nothing

m_add2 : Maybe Nat -> Maybe Nat -> Maybe Nat
m_add2 a b = plus <$> a <*> b

m_add3 : Maybe Nat -> Maybe Nat -> Maybe Nat
m_add3 a b = [| a + b |]

m_add4 : Maybe Nat -> Maybe Nat -> Maybe Nat
m_add4 a b = pure (!a + !b)

a_add : (Semigroup a, Applicative f) => f a -> f a -> f a
a_add a b = [| a <+> b |]
