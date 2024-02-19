import System.Environment
import System.IO
import System.Directory
import Data.Char

replacePunctuation :: Char -> String -> String
replacePunctuation repl = map (\c -> if isPunctuation c then repl else c)

main :: IO()
main = do
  args <- getArgs
  if length args /= 3
    then putStrLn "Invalid arguments. Usage: task2 [input filename] [output filename] [symbol]"
    else do
      let 
        src = args !! 0
        dst = args !! 1
        repl = head $ args !! 2
      srcExists <- doesFileExist src
      if not srcExists
        then putStrLn "Source file does not exist."
        else do
          srcText <- readFile src
          writeFile dst (replacePunctuation repl srcText)
