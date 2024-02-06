import System.IO
import Control.Monad
import Data.List
import Data.Char

mainLoop :: String -> IO()
mainLoop filename = do
  putStr "> "
  cmd <- getLine
  executeCmd cmd filename
  if cmd /= "quit" then mainLoop filename else putStrLn "Finished"

executeCmd :: String -> String -> IO()
executeCmd cmd filename | cmd == "print" = printFile filename
                        | cmd == "add" = addLine filename
                        | cmd == "remove" = removeLine filename
                        | cmd == "fnl" = filterNewLines filename
                        | cmd == "fp" = filterPunctuation filename
                        | cmd == "quit" = putStrLn "Quit"
                        | otherwise  = putStrLn "Unknown command"

printFile :: String -> IO()
printFile filename = do
  contents <- readFile filename
  putStr $ prependLineNumbers contents
  where
    prependLineNumbers :: String -> String
    prependLineNumbers text = unlines $ zipWith (\n line -> show n ++ ": " ++ line) [0..] (lines text)

addLine :: String -> IO()
addLine filename = do
  putStr "Enter line number to add a new line after: "
  n <- readNum
  putStr "Enter the new line: "
  line <- getLine
  contents <- readFile filename
  let fileLines = lines contents
  writeFile filename (unlines $ take n fileLines ++ [line] ++ drop n fileLines)
  where
    readNum :: IO Int
    readNum = readLn

removeLine :: String -> IO()
removeLine filename = do
  putStr "Enter line number: "
  n <- readNum
  contents <- readFile filename
  let fileLines = lines contents
  writeFile filename (unlines $ delete (fileLines !! n) fileLines)
  where
    readNum :: IO Int
    readNum = readLn

filterNewLines :: String -> IO()
filterNewLines filename = do
  putStr "All new lines will be replaced with whitespaces\nEnter new file name: "
  dstFilename <- getLine
  contents <- readFile filename
  writeFile dstFilename $ intercalate " " $ lines contents

filterPunctuation :: String -> IO()
filterPunctuation filename = do
  putStr "All punctuation will be removed\nEnter new file name: "
  dstFilename <- getLine
  contents <- readFile filename
  writeFile dstFilename $ filter (not . isPunctuation) contents

main :: IO()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Enter the name of the file to work with: "
  filename <- getLine
  mainLoop filename
