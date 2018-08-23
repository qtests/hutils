module Main where

  import System.IO
  import System.Environment
  import Data.Maybe 

  import Parsers.INIParser
  
  main :: IO ()
  main = do
    args <- getArgs
    contents <- readFile (head args)
    case runParser ini contents of
      Just inicontents -> do print inicontents
                             do 
                                 let d = fromMaybe "2000-01-01" $ lookupSectionVariable (fst inicontents) "TimeSeries" "startdate"
                                 print $ read2UTCTime "%Y-%m-%d" d
                          
      Nothing          -> putStrLn "Could not parse INI file"
