-------------------------------------------------------------------------------
--------------------------------- PARTE 1 -------------------------------------
-------------------------------------------------------------------------------
somaInt :: Integer -> [Integer]
somaInt n = map (\x->(div (x*(x+1)) 2)) ([1..n])

totaLista :: Integer -> Integer
totaLista n = getUltimoElemento (somaInt n)

-- SomaDosTermosPA = (a1 + an) * n / 2
-- As somas dos pares, impares e inteiros podem ser calculadas como PA.
totalLista :: [Integer] -> Integer
totalLista [] = 0
totalLista (x:[]) = x
totalLista (x:xs) = div ((x + getUltimoElemento xs) * (1+getTamanhoLista xs)) 2

totalListaPares :: Integer -> Integer
totalListaPares n = totalLista [2, 4..n]

totalListaImpares :: Integer -> Integer
totalListaImpares n = totalLista [1, 3..n]

totalListaInteiros :: Integer -> Integer
totalListaInteiros n = totalLista [1..n]

-- totalQuadradoInteiros = (n+1)n(2n+1)/6 -- http://www.tutorbrasil.com.br
totalQuadradoInteiros :: Integer -> Integer
totalQuadradoInteiros n = div ((n+1)*n*(2*n+1)) 6

-- QuantosImparesAteN = getTamanhoLista [1, 3..n]
-- SomaDosQuadradosDosNPrimeirosImpares =n(2n+1)(2n-1)/3 -- http://www.soensino.com.br
-- totalQuadradoImpares = SomaDosQuadradosDosNPrimeirosImpares (substituindo n por QuantosImparesAteN)
totalQuadradoImpares :: Integer -> Integer
totalQuadradoImpares n = div ((getTamanhoLista [1, 3..n])*(2*(getTamanhoLista [1, 3..n])+1)*(2*(getTamanhoLista [1, 3..n])-1)) 3
-------------------------------------------------------------------------------
--------------------------------- PARTE 2 -------------------------------------
-------------------------------------------------------------------------------
quaseUm :: Int -> Double
quaseUm n = sum(map (\x->(1/(x^2+x))) (take n [1..]))

quaseDois :: Int -> Double
quaseDois n = sum(map (\x->(2/(x^2+x))) (take n [1..]))

quaseE :: Int -> Double
quaseE n = sum(map (\x->(2.7182818285/(x^2+x))) (take n [1..]))
-------------------------------------------------------------------------------
-------------------------------- Auxiliares -----------------------------------
-------------------------------------------------------------------------------
getUltimoElemento :: [a] -> a
getUltimoElemento (x:[]) = x
getUltimoElemento (x:xs) = getUltimoElemento xs

getTamanhoLista :: [a] -> Integer
getTamanhoLista [] = 0
getTamanhoLista (x:xs) = 1 + getTamanhoLista xs
