import System.IO
import Data.Map (fromListWith, toList)
import Data.List (intercalate, sortBy)
import Data.Char (isPunctuation)

partitionN :: [a] -> Int -> [[a]]
partitionN [] _ = []
partitionN _ 0 = []
partitionN xs n = [take count xs] ++ (partitionN (drop count xs) n)
  where count = length xs `div` n

elemIndices :: Eq a => a -> [a] -> [Int]
elemIndices e xs = foldl (\acc (i, x) -> if x == e then acc ++ [i] else acc) [] (zip [0..] xs)

generatePowers :: Int -> Int -> [[Int]]
generatePowers n m = [[x^y | y <- [1..n]] | x <- [1..m]]

countWordsInFile :: String -> String -> IO()
countWordsInFile inputFilename outputFilename = do
  contents <- readFile inputFilename
  writeFile outputFilename $ intercalate "\n" $ map (\(x, i) -> show i ++ ":" ++ x) $ sortPairs $ countWords contents
  where
    countWords :: String -> [(String, Int)]
    countWords text = toList $ fromListWith (+) [(x, 1) | x <- (words text)]
    
    sortPairs :: [(String, Int)] -> [(String, Int)]
    sortPairs xs = sortBy (\(x1, i1) (x2, i2) -> if i1 < i2 then GT else LT) xs

main :: IO()
main = do
  putStrLn "partitionN"
  -- print(partitionN [1, 2, 3, 4, 5, 6, 7] 3)
  -- print(partitionN [1, 2, 3, 4, 5, 6, 7] 4)
  -- print(partitionN [1,2,3,4] 7)
  -- print(partitionN [1, 2, 3, 4, 5, 6, 7] 0)
  -- Из-за возвращения пустого списка Show роняет ошибку,
  -- поэтому проверяем пограничное условие через length.
  -- print(length $ partitionN [] 4)
  putStrLn ""

  putStrLn "elemIndices"
  print(elemIndices 2 [1, 3, 2, 5, 2, 12, 34, 2, 9])
  print(elemIndices 8 [1, 3, 2, 5, 2, 12, 34, 2, 9])
  print(elemIndices 8 [])
  putStrLn ""

  putStrLn "generatePowers"
  print(generatePowers 2 4)
  print(generatePowers 0 4)
  print(generatePowers 3 0)
  putStrLn ""

  countWordsInFile "input.txt" "output.txt"
