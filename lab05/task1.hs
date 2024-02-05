import System.IO

main :: IO()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Enter starting value: "
  start <- readNum
  putStr "Enter element count: "
  count <- readNum
  putStr "Enter multiplicator: "
  mult <- readNum
  print [start + mult * x | x <- [0..count - 1]]
  where
    readNum :: IO Integer
    readNum = readLn
