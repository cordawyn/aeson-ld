module Data.Aeson.LinkedData where

import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L

decode :: (A.FromJSON a) => L.ByteString -> Maybe a
decode = A.decode
