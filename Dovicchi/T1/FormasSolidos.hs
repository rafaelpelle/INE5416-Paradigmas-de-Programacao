module Formas (Forma (Esfera,Cilindro,Cone,TroncoCone,EsfOblato,EsfProlato),Raio,Lado,area) where
data Forma = Esfera Raio | Cilindro Raio Lado | Cone Raio Lado | TroncoCone Raio Raio Lado | EsfOblato Raio Raio | EsfProlato Raio Raio
type Raio = Double
type Lado = Double


area :: Forma -> Double
area (Esfera r) = 4 * pi * r * r
area (Cilindro r l) = 2 * pi * r * l + 2 * pi * r * r
area (Cone r l) = pi * r * (sqrt (r * r + l * l) + r)
area (TroncoCone r1 r2 l) = pi * r1**2 + pi * r2**2 + pi * (r1 + r2) * sqrt (l * l + (r1 - r2)**2)
area (EsfOblato a b) = (2*pi*a) * (a + b**2 / sqrt(a**2 - b**2) * asinh(sqrt(a**2 - b**2)/b))
area(EsfProlato a b) = (2*pi*a) * (a + b**2 / sqrt(b**2 - a**2) * asin(sqrt(b**2 - a**2)/b))

areaLateral :: Forma -> Double
areaLateral (Cilindro r l) = 2 * pi * r * l
areaLateral (Cone r l) = pi * r * sqrt (r * r + l * l)
areaLateral (TroncoCone r1 r2 l) = pi * (r1 + r2) * sqrt (l * l + (r1 - r2)**2)

volume :: Forma -> Double
volume (Esfera r) = 4/3 * pi * r**3
volume (Cilindro r l) = pi * r * r * l
volume (Cone r l) = 1/3 * pi * r * r * l
volume (TroncoCone r1 r2 l) = 1/3 * pi * l * (r1**2 + r2**2 + r1*r2)
volume (EsfOblato a b) = 4/3 * pi * a**2 * b
volume (EsfProlato a b) = 4/3 * pi * a * b**2
