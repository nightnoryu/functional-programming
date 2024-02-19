import System.IO

findStart :: Int -> Int -> Int
findStart start multiplicator | start `mod` multiplicator == 0 = start
                              | otherwise                      = findStart (start + 1) multiplicator

main :: IO()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Enter starting value: "
  start <- readNum
  putStr "Enter element count: "
  count <- readNum
  putStr "Enter multiplicator: "
  multiplicator <- readNum

  let actualStart = findStart start multiplicator
  print [actualStart + multiplicator * x | x <- [0..count - 1]]

  where
    readNum :: IO Int
    readNum = readLn
