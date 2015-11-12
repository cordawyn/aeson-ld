module Data.Aeson.LinkedDataTest where

import Data.Aeson.LinkedData

import Manifest

import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.HashMap.Strict as HM
import qualified Data.Vector as V

-- Expanding an empty JSON object returns an empty JSON object
propDecodeEmpty :: Bool
propDecodeEmpty =
  decode "{}"
  == Just (A.Object (HM.fromList []))

-- Value of @id key is interpreted as a URI
propIdIsURI :: Bool
propIdIsURI =
  decode "{ \"@id\": \"http://example.org/stuff/1\" }"
  == Just (A.Object (HM.fromList [("@id", "http://example.org/stuff/1")]))

-- Single-item lists are compacted into single items
propSingleItemList :: Bool
propSingleItemList =
  decode "{ \"http://example.org/items/\": [10], \"http://example.org/things/\": [2, 3] }"
  == Just (A.Object (HM.fromList [("http://example.org/items/", A.Number 10),
                                  ("http://example.org/things/", A.Array (V.fromList [A.Number 2, A.Number 3]))]))
