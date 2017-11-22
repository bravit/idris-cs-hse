abs' : (Ord a, Neg a) => a -> a
abs' a = if a > 0 then a else -a

sqr' : Num a => a -> a
sqr' a = a * a

average : Double -> Double -> Double
average a b = (a + b) / 2

eps : Double
eps = 0.00000000001

sqrt' : Double -> Double
sqrt' y = go 1
  where
    goodEnough : Double -> Bool
    goodEnough x = abs' (sqr' x - y) < eps    
    improve : Double -> Double
    improve x = average x (y/x)
    go : Double -> Double
    go guess = if goodEnough guess then guess 
               else go (improve guess)


newton : (Double -> Double -> Double) -- improve
          -> (Double -> Double) -- проверка
          -> Double -> Double -- аргумент и результат
newton improve check y = go 1
  where
    goodEnough : Double -> Bool
    goodEnough x = abs' (check x - y) < eps
    go : Double -> Double
    go guess = if goodEnough guess then guess
               else go (improve guess y)

sqrt'' : Double -> Double
sqrt'' = newton (\x, y => average x (y/x)) sqr'

cbrt : Double -> Double
cbrt = newton (\x, y => (2*x+y/(x*x))/3) (\x => x * x * x)
