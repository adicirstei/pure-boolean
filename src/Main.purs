module Main where

import Prelude
import HTTP.Request
import Node.Process as Proc
import Control.Monad.Aff (Aff, launchAff, makeAff, runAff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Exception (EXCEPTION, Error)
import Data.Array (drop, intersect)

redditUri :: String
redditUri = "https://www.reddit.com/r/purescript.json"


redditAff :: forall e. Aff ( ajax :: AJAX | e) String
redditAff = makeAff $ httpGet redditUri

--
-- callback :: forall e. Client.Response -> Eff ( http :: HTTP | e) Unit
-- callback res =






-- main :: forall e. Eff (console :: CONSOLE, process :: Proc.PROCESS, ajax :: AJAX, exception :: EXCEPTION | e) 
main = 
  launchAff $ do
    -- args <- Proc.argv
    redStr <- redditAff
    liftEff $ log redStr
    -- liftEff $ log $ show args
    -- log $ show args
    -- log $ show redStr








-- main =
--   bind 
--     Proc.argv
--     (\args -> 
--       discard 
--         (log "Here comes the aguments") 
--         (\_ -> log $ show args)
    
--     )
    

  

