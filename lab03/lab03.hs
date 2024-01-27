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

mysubst :: Eq a => [a] -> [a] -> [a]
mysubst a [] = a
mysubst [] b = []
mysubst (x:xs) (y:ys) | x == y    = mysubst xs (y:ys)
                      | elem y xs = mysubst (xs ++ [x]) (y:ys)
                      | otherwise = mysubst (x:xs) ys

getNthElementsList :: Int -> [[a]] -> [a]
getNthElementsList n l = map (\x -> x !! n) l

main :: IO()
main = do
  print(listnums 10)
  print(secondlastlist [[1, 2, 3], [4, 5, 6], [42, 56], [], [1]])
  print(myunion [1, 3, 4, 5] [1, 2, 4, 6])
  print(mysubst [1, 2, 3, 4, 5, 10] [1, 3, 6, 7, 5])
  print(getNthElementsList 1 [[1, 2, 3], [4, 5, 6, 7], [9, 45]])
