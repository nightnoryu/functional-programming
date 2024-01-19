generateTriangularNumbers :: Int -> [Int]
generateTriangularNumbers len = [sum [1..n] | n <- [1..len]]

-- Пирамидальные числа с треугольником в основании
-- Находятся как сумма n первых треугольных чисел
generateTetrahedronNumbers :: Int -> [Int]
generateTetrahedronNumbers len = [sum $ generateTriangularNumbers n | n <- [1..len]]

main :: IO ()
main = do
  print(generateTetrahedronNumbers 50)
