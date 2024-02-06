import System.IO
import Control.Monad
import Data.List
import Data.Char

mainLoop :: Handle -> IO()
mainLoop handle = do
  putStr "> "
  cmd <- getLine
  executeCmd cmd handle
  if cmd /= "quit" then mainLoop handle else putStrLn "Finished"

executeCmd :: String -> Handle -> IO()
executeCmd cmd handle | cmd == "print" = printFile handle
                      | cmd == "add" = addLine handle
                      | cmd == "remove" = removeLine handle
                      | cmd == "fnl" = filterNewLines handle
                      | cmd == "fp" = filterPunctuation handle
                      | cmd == "quit" = putStrLn "Quit"
                      | otherwise  = putStrLn "Unknown command"

printFile :: Handle -> IO()
printFile handle = hGetContents handle >>= \contents -> putStr $ prependLineNumbers contents
  where
    prependLineNumbers :: String -> String
    prependLineNumbers text = unlines $ zipWith (\n line -> show n ++ ": " ++ line) [0..] (lines text)

addLine :: Handle -> IO()
addLine handle = do
  putStr "Enter line number to add a new line after: "
  n <- readNum
  putStr "Enter the new line: "
  line <- getLine
  contents <- hGetContents handle
  let fileLines = lines contents
  hPutStr handle (unlines $ take n fileLines ++ [line] ++ drop n fileLines)
  where
    readNum :: IO Int
    readNum = readLn

removeLine :: Handle -> IO()
removeLine handle = do
  putStr "Enter line number: "
  n <- readNum
  contents <- hGetContents handle
  let fileLines = lines contents
  hPutStr handle (unlines $ delete (fileLines !! n) fileLines)
  where
    readNum :: IO Int
    readNum = readLn

filterNewLines :: Handle -> IO()
filterNewLines handle = do
  putStr "All new lines will be replaced with whitespaces\nEnter new file name: "
  fileName <- getLine
  contents <- hGetContents handle
  writeFile fileName $ intercalate " " $ lines contents

filterPunctuation :: Handle -> IO()
filterPunctuation handle = do
  putStr "All punctuation will be removed\nEnter new file name: "
  fileName <- getLine
  contents <- hGetContents handle
  writeFile fileName $ filter (not . isPunctuation) contents

main :: IO()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Enter the name of the file to work with: "
  fileName <- getLine
  handle <- openFile fileName ReadWriteMode
  mainLoop handle
  hClose handle
