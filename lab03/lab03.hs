module Main(listnums, secondlastlist, myunion, main) where
import System.IO

listnums :: Int -> [Int]
listnums 1 = [1]
listnums n = n : listnums (n - 1)

secondlastlist :: [[a]] -> [a]

myunion :: Eq a => [a] => [a] => [a]

mysubst :: Eq a => [a] => [a] => [a]

getNthElementsList :: Int -> [[a]] -> [a]

main = do
  print(listnums 10)
