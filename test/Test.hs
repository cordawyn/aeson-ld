module Main where

import Test.Framework (defaultMain)
import Test.Framework.Providers.QuickCheck2

import Data.Aeson.LinkedDataTest

main :: IO ()
main = defaultMain [
  testProperty "Expansion of an empty JSON-LD" propDecodeEmpty
  ]
