module Main where

import Test.Framework (defaultMain)
import Test.Framework.Providers.QuickCheck2

import Data.Aeson.LinkedDataTest

main :: IO ()
main = defaultMain [
  testProperty "Expansion of an empty JSON-LD" propDecodeEmpty
  , testProperty "Value of @id is a URI" propIdIsURI
  , testProperty "Single-item lists are compacted into single items" propSingleItemList
  ]
