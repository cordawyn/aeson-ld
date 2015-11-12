module Data.Aeson.LinkedData where

import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L

-- Extensions and overrides

decode :: A.FromJSON a => L.ByteString -> Maybe a
decode = A.decode
