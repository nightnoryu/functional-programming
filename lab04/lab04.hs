module Main(permutate, insert, lines, phase, inRange, main) where
import System.IO
import Data.List
import Data.Maybe

-- permutate (Data.List.permutate): генерация перестановок списка
permutate :: Eq a => [a] -> [[a]]
permutate [] = [[]]
permutate l = [a:x | a <- l, x <- permutate $ delete a l]

-- myinsert (Data.Map.insert): вставка значения по ключу в ассоциативный массив
myinsert :: Ord k => k -> a -> [(k, a)] -> [(k, a)]
myinsert key value m = filter (\x -> fst x /= key) m ++ [(key, value)]

-- mylines (Data.String.lines): разбиение строки по переносам строк
mylines :: String -> [String]
mylines s | i == Nothing = [s]
          | otherwise    = take (fromJust i) s : mylines (drop (fromJust i + 1) s)
  where i = findIndex (== '\n') s

-- phase (Data.Complex.phase): вычисление фазы комплексного числа
phase :: RealFloat a => (a, a) -> a
phase c = atan(b / a) + shift
  where a = fst c
        b = snd c
        shift | a > 0 && b > 0 = 0
              | a < 0 && b > 0 = pi
              | a < 0 && b < 0 = -pi
              | otherwise      = 0

-- inRange (Data.Ix.InRange): проверка на принадлежность значения перечислимому диапазону
inRange :: Ord a => (a, a) -> a -> Bool
inRange (l, r) e = l <= e && e <= r

main :: IO()
main = do
  print(permutate "abc")
  print(permutate "")
  print(permutate [1, 2, 3, 4, 5])
  putStrLn ""

  print(myinsert 5 'a' [(3, 'b'), (7, 'o')])
  print(myinsert 5 'a' [(5, 'c'), (3, 'b'), (7, 'o')])
  print(myinsert 5 'b' [])
  putStrLn ""

  print(mylines "line one\n")
  print(mylines "\nline 2\nanother line\n")
  print(mylines "\n")
  print(mylines "")
  putStrLn ""

  print(phase (2, 3))
  print(phase (-2, -1.5))
  print(phase (-4, 2.3))
  print(phase (3.6, -1.9))
  print(phase (0, 4))
  putStrLn ""

  print(inRange (2, 5) 3)
  print(inRange (2, 5) 8)
  print(inRange (1, 128) 128)
  print(inRange ('a', 'u') 'i')
  putStrLn ""
