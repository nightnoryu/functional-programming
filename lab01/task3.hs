isOdd :: Int -> Bool
isOdd x = x `mod` 2 /= 0

generateViaFilter :: Int -> [Int]
generateViaFilter len = take len (filter isOdd [0..])

generateViaListBuilder :: Int -> [Int]
generateViaListBuilder len = take len [x | x <- [0..], x `mod` 2 /= 0]

generateViaProgression :: Int -> [Int]
generateViaProgression len = [2 * x + 1 | x <- [0..(len - 1)]]

-- Дополнительный метод через рекурсию
generateViaRecursion :: Int -> [Int]
generateViaRecursion 1 = [1]
generateViaRecursion len = previousNumbers ++ [(head $ reverse previousNumbers) + 2]
  where previousNumbers = generateViaRecursion $ len - 1

main :: IO ()
main = do
  print(generateViaFilter 20)
  print(generateViaListBuilder 20)
  print(generateViaProgression 20)
  print(generateViaRecursion 20)
