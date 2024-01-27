listnums :: Int -> [Int]
listnums n | n <= 0    = []
           | n == 1    = [1]
           | otherwise = n : listnums (n - 1)

secondlastlist :: [[a]] -> [a]
secondlastlist [] = []
secondlastlist (x:xs) | length x == 0 = secondlastlist xs
                      | otherwise     = last x : secondlastlist xs

myunion :: Eq a => [a] -> [a] -> [a]
myunion a [] = a
myunion [] b = b
myunion a (x:xs) | elem x a  = myunion a xs
                 | otherwise = myunion (x:a) xs

-- mysubst :: Eq a => [a] -> [a] -> [a]

-- getNthElementsList :: Int -> [[a]] -> [a]

main :: IO()
main = do
  print(listnums 10)
  print(secondlastlist [[1, 2, 3], [4, 5, 6], [42, 56], [], [1]])
  print(myunion [1, 3, 4, 5] [1, 2, 4, 6])
  -- print(mysubst [1, 2, 3, 4, 5] [1, 3, 6, 7, 5])
