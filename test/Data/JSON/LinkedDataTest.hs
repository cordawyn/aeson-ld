module Data.JSON.LinkedDataTest where

import Data.JSON.LinkedData

-- Expanding an empty JSON object returns an empty JSON object
propExpandJSONLDEmpty :: Int -> Bool
propExpandJSONLDEmpty n = expandJSONLD n == n
