import System.IO
import Data.Char

replacePunctuation :: Char -> String -> String
replacePunctuation repl = map (\c -> if isPunctuation c then repl else c)

main :: IO()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Enter source file name: "
  src <- getLine
  putStr "Enter destination file name: "
  dst <- getLine
  putStr "Enter symbol to replace punctuation with: "
  repl <- getChar

  srcText <- readFile src
  writeFile dst (replacePunctuation repl srcText)
