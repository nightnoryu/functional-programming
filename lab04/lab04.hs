module Main(permutate, insert, lines, phase, inRange, main) where
import System.IO
import Data.List
import Data.Maybe

permutate :: Eq a => [a] -> [[a]]
permutate [] = [[]]
permutate l = [a:x | a <- l, x <- permutate $ delete a l]

myinsert :: Ord k => k -> a -> [(k, a)] -> [(k, a)]
myinsert key value m = filter (\x -> fst x /= key) m ++ [(key, value)]

mylines :: String -> [String]
mylines s | i == Nothing = [s]
          | otherwise    = take (fromJust i) s : mylines (drop (fromJust i + 1) s)
  where i = findIndex (== '\n') s

phase :: RealFloat a => (a, a) -> a
phase c = atan(b / a) + shift
  where a = fst c
        b = snd c
        shift | a > 0 && b > 0 = 0
              | a < 0 && b > 0 = pi
              | a < 0 && b < 0 = -pi
              | otherwise      = 0

inRange :: (Int, Int) -> Int -> Bool
inRange (l, r) a = elem a [l..r]

main :: IO()
main = do
  print(permutate "abc")
  print(myinsert 5 'a' [(5, 'c'), (3, 'b'), (7, 'o')])
  print(mylines "\nline 2\nanother line\n")
  print(phase (2, 3))
  print(inRange (2, 5) 3)
