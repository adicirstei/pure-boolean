module Main where

import Prelude
import HTTP.Request
import Spotify
import Node.Process as Proc
import Control.Bind ((=<<))
import Control.Monad.Aff (Aff, Canceler, launchAff, makeAff, runAff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Array (drop, intersect)
import Data.Either (Either(..))
import Data.Eq (class Eq)
import Data.List (List(..), (:), fromFoldable)
import Data.Traversable (traverse)
import Node.Process (PROCESS, argv)


names =
  Proc.argv 
  <#> drop 2

<<<<<<< HEAD

related :: forall e. String -> Aff ( ajax :: AJAX, console :: CONSOLE | e) (Array String)
related name = do
  eitherArtist <- findArtist name
  case eitherArtist of
    Left _ -> pure []
    Right a -> do 
     liftEff $ log (a.name)
     artistsEither <- relatedArtists (a.id)
     case artistsEither of
       Left _ -> pure []
       Right xs -> pure (map _.name xs)

intersection :: forall a. Eq a => List (Array a) -> Array a
intersection Nil = []
intersection (x : Nil) = x
intersection (x : y : xss) = intersection ((intersect x y) : xss)




=======
>>>>>>> b3fa5d42d4649afc5e953ad9a0b75291ca93ff54

main :: forall e.                 
  Eff ( exception :: EXCEPTION, ajax :: AJAX, console :: CONSOLE, process :: PROCESS | e )                       
      ( Canceler ( ajax :: AJAX, console :: CONSOLE, process :: PROCESS | e ) )
main = 
  launchAff $ do
<<<<<<< HEAD
    names <- liftEff names
    rels <- traverse related names
    --suggestions <- foldMap int
    liftEff $ log $ show (intersection $ fromFoldable rels)
=======
    
    redStr <- redditAff
    liftEff $ do 
      args <- Proc.argv
      log redStr
      log $ show args




>>>>>>> b3fa5d42d4649afc5e953ad9a0b75291ca93ff54
