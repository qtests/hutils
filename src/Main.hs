module Main where

  import System.IO
  import System.Environment

  import Parsers.INIParser
  
  main :: IO ()
  main = do
    args <- getArgs
    contents <- readFile (head args)
    case runParser ini contents of
      Just inicontents -> do print inicontents
                             print $ lookupSectionVariable (fst inicontents) "TimeSeries" "startdate"
                          
      Nothing          -> putStrLn "Could not parse INI file"
