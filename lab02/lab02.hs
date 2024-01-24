module lab02 where
import System.IO

do_my_list :: Int -> [Int]
do_my_list N = [N..(N + N)]

oddEven :: [a] -> [a]
oddEven L =

insert :: [a] -> a -> Int -> [a]
insert L A n =

listSumm :: Number a => [a] -> [a] -> [a]
listSumm L1 L2 =

F1 :: Int -> Int
F1 n = sum [1..n]

F2 :: Int -> Int
F2 n = sum [n - i | i <- [1..n]]
