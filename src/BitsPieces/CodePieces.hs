module BitsPieces.CodePieces
(
    nubOrd
)
where

import qualified Data.Set as Set

-- https://stackoverflow.com/questions/3098391/unique-elements-in-a-haskell-list
nubOrd :: Ord a => [a] -> [a] 
nubOrd xs = go Set.empty xs where
  go s (x:xs)
   | x `Set.member` s = go s xs
   | otherwise        = x : go (Set.insert x s) xs
  go _ _              = []
