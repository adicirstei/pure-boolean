module Spotify (findArtist, relatedArtists) where

import Prelude
import HTTP.Request
import Data.Generic.Rep
import Control.Monad.Aff (Aff, makeAff)
import Control.Monad.Except (runExcept)
import Data.Array (head)
import Data.Either (Either(..))
import Data.Foreign (F, Foreign, ForeignError(..), readArray, readString)
import Data.Foreign.Class (class Decode)
import Data.Foreign.Index ((!))
import Data.Foreign.JSON (parseJSON)
import Data.Int.Bits (xor)
import Data.List.NonEmpty (singleton)
import Data.List.Types (NonEmptyList)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Traversable (oneOf, traverse)


type Artist = { id :: String, name :: String }

newtype Result = Result { artists :: { items :: Array Artist } }

readArtist :: Foreign -> F Artist
readArtist value = do
  id <- value ! "id" >>= readString
  name <- value ! "name" >>= readString
  pure $  { id, name }


readArtists :: Foreign -> F { items :: Array Artist }
readArtists value = do
  items <- value ! "items" >>= readArray >>= traverse readArtist
  pure $ { items }

readResult :: Foreign -> F Result
readResult value = do
  artists <- value ! "artists" >>= readArtists
  pure $ Result { artists }

readRelated :: Foreign -> F (Array Artist)
readRelated value = do
  artists <- value ! "artists" >>= readArray >>= traverse readArtist
  pure $ artists




findArtist name =
  (makeAff $ httpGet url)
  <#> parse 
  -- <#> (\e -> e <#> (\(Result r) -> head (r.artists.items)) )  
  <#> (\e -> 
    case e of 
      Left x -> Left x
      Right (Result r) -> 
        case head (r.artists.items) of 
          Nothing -> Left (singleton (ForeignError "Artist not found"))
          Just h -> Right h
  )    

  where 
    parse str = runExcept $ join $ map readResult $ parseJSON str
      
    url = "https://api.spotify.com/v1/search?q=" <> name <> "&type=artist"


relatedArtists id = 
  (makeAff $ httpGet url)
  <#> parse 

  where
    parse str = 
      runExcept $ join $ map readRelated $ parseJSON str    
    url = "https://api.spotify.com/v1/artists/" <> id <> "/related-artists"


