isEven :: Int -> Bool
isEven x = x `mod` 2 == 0

generateNaturalNumbers :: Int -> [Int]
generateNaturalNumbers 1 = [0]
generateNaturalNumbers len = previousNumbers ++ [(head $ reverse previousNumbers) + 2]
  where previousNumbers = generateNaturalNumbers $ len - 1

main :: IO ()
main = do
print(take 20 (filter isEven [0..]))
print(take 20 [x | x <- [0..], x `mod` 2 == 0])
print([x * 2 | x <- [0..19]])

print(generateNaturalNumbers 20) -- Additional method using recursion
