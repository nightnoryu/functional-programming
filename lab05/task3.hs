import System.IO
import Data.List

printFileContents :: String -> IO()
printFileContents fileName = readFile fileName >>= \contents -> putStr $ prependLineNumbers contents
  where
    prependLineNumbers :: String -> String
    prependLineNumbers text = unlines $ zipWith (\n line -> show n ++ ": " ++ line) [1..] (lines text)

deleteAt :: Int -> [a] -> [a]
deleteAt i xs = left ++ right
  where (left, (_:right)) = splitAt i xs

main :: IO()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Enter the name of the file to work with: "
  fileName <- getLine

  printFileContents fileName
