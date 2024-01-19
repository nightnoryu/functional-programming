-- Треугольные числа
-- Находятся как сумма n первых натуральных чисел
generateTriangularNumbers :: Int -> [Int]
generateTriangularNumbers len = [sum [1..n] | n <- [1..len]]

main :: IO ()
main = do
  print(generateTriangularNumbers 50)
