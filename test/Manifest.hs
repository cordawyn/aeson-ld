module Manifest where

import Data.Aeson
import GHC.Generics
import Data.Text (Text, pack, unpack)
import Data.Maybe (fromJust)
import Network.URI (URI, parseURI)

data Manifest = Manifest {
  mfName :: Text
, mfDescription :: Text
, mfBaseIRI :: URI
, mfSequence :: [JSONLDTest]
} deriving (Generic, Show)

data JSONLDTest = JSONLDTest {
  jtId :: Text
, jtName :: Text
, jtPurpose :: Text
, jtInput :: FilePath
, jtContext :: FilePath
, jtExpect :: FilePath
} deriving (Generic, Show)

instance ToJSON URI where
  toJSON = String . pack . show

instance FromJSON URI where
  parseJSON (String u) = pure $ fromJust $ parseURI $ unpack u
  parseJSON _          = error "Invalid URI format"

instance ToJSON Manifest where
  toJSON (Manifest mfName mfDescription mfBaseIRI mfSequence) =
    object [ "name" .= mfName
           , "description" .= mfDescription
           , "baseIri" .= mfBaseIRI
           , "sequence" .= mfSequence ]

instance FromJSON Manifest where
  parseJSON (Object m) = Manifest <$>
                         m .: "name" <*>
                         m .: "description" <*>
                         m .: "baseIri" <*>
                         m .: "sequence"

instance ToJSON JSONLDTest where
  toJSON (JSONLDTest jtId jtName jtPurpose jtInput jtContext jtExpect) =
    object [ "id" .= jtId
           , "name" .= jtName
           , "purpose" .= jtPurpose
           , "input" .= jtInput
           , "context" .= jtContext
           , "expect" .= jtExpect ]

instance FromJSON JSONLDTest where
  parseJSON (Object m) = JSONLDTest <$>
                         m .: "id" <*>
                         m .: "name" <*>
                         m .: "purpose" <*>
                         m .: "input" <*>
                         m .: "context" <*>
                         m .: "expect"
