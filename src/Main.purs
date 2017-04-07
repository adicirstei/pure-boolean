module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

import Node.HTTP.Client as Client
import Node.HTTP (HTTP)

redditUri = "https://www.reddit.com/r/purescript.json"

--redditReq = Client.requestFromURI redditUri \response -> void




main :: forall e. Eff (console :: CONSOLE, http :: HTTP | e) Unit
main = do
  log "Hello sailor!"
