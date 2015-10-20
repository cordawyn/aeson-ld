module Data.Aeson.LinkedDataTest where

import Data.Aeson.LinkedData

import qualified Data.Aeson as A

import qualified Data.ByteString.Lazy as L
import qualified Data.HashMap.Strict as HashMap

-- Expanding an empty JSON object returns an empty JSON object
propDecodeEmpty :: Bool
propDecodeEmpty = decode "{}" == Just (A.Object (HashMap.fromList []))
