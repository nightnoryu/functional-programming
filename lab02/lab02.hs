module Main (do_my_list, oddEven, insert, listSumm, f1, f2, main) where
import System.IO

do_my_list :: Int -> [Int]
do_my_list n = [n..(n + n - 1)]

oddEven :: [a] -> [a]
oddEven l | length l == 0 = []
          | length l == 1 = l
          | otherwise     = [head $ tail l,head l] ++ (oddEven $ tail $ tail l)

insert :: [a] -> a -> Int -> [a]
insert l a n = (take n l) ++ [a] ++ (drop n l)

listSumm :: Num a => [a] -> [a] -> [a]
listSumm l1 l2 = map (\(a,b) -> a + b) (zip l1 l2)

f1 :: Int -> Int
f1 n = sum [1..n]

f2 :: Int -> Int
f2 n = sum [n - i | i <- [1..n]]

main = do
  print(do_my_list 5)
  print(oddEven [2,5,7,9,1,8])
  print(insert [0,1,2,3,4,5] 42 3)
  print(listSumm [20, 15, 62, 31, 42] [100, 120, 150])
  print(f1 5)
  print(f2 5)
