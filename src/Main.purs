module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

import Node.HTTP.Client as Client
import Node.HTTP (HTTP)

redditUri = "https://www.reddit.com/r/purescript.json"

--redditReq = Client.requestFromURI redditUri \response -> void


callback :: forall e. Client.Response -> Eff ( http :: HTTP | e) Unit
callback res = pure

req :: forall t2. (Client.Response -> Eff ( http :: HTTP | t2) Unit)
  -> Eff ( http :: HTTP | t2 ) Client.Request
req = Client.requestFromURI redditUri


main :: forall e. Eff (console :: CONSOLE, http :: HTTP | e) Unit
main = do
  log "Hello sailor!"
