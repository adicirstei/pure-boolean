module Main where

import Prelude
import HTTP.Request
import Node.Process as Proc
import Control.Monad.Aff (Aff, Canceler, launchAff, makeAff, runAff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Exception (EXCEPTION)
--import Data.Array (drop, intersect)
import Node.Process (PROCESS)


redditAff :: forall e. Aff ( ajax :: AJAX | e) String
redditAff = makeAff $ httpGet "https://www.reddit.com/r/purescript.json"

--
-- callback :: forall e. Client.Response -> Eff ( http :: HTTP | e) Unit
-- callback res =





main :: forall e.                 
  Eff ( exception :: EXCEPTION, ajax :: AJAX, console :: CONSOLE, process :: PROCESS | e )                       
      ( Canceler ( ajax :: AJAX, console :: CONSOLE, process :: PROCESS | e ) )
main = 
  launchAff $ do
    
    redStr <- redditAff
    liftEff $ do 
      args <- Proc.argv
      log redStr
      log $ show args




-- main =
--   bind 
--     Proc.argv
--     (\args -> 
--       discard 
--         (log "Here comes the aguments") 
--         (\_ -> log $ show args)
    
--     )
    

  

