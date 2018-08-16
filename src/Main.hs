module Main where

  import System.IO
  import System.Environment

  import Parsers.INIParser
  
  main :: IO ()
  main = do
    args <- getArgs
    contents <- readFile (head args)
    case runParser ini contents of
      Just inicontents -> print inicontents
      Nothing          -> putStrLn "Could not parse INI file"
