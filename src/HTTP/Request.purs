module HTTP.Request (httpGet, AJAX) where

import Prelude (Unit)
import Control.Monad.Eff (kind Effect, Eff)
import Control.Monad.Eff.Exception (Error)

foreign import data AJAX :: Effect

foreign import httpGet :: forall e. 
  String -> 
  (Error -> Eff (ajax :: AJAX | e) Unit) -> 
  (String -> Eff (ajax :: AJAX | e) Unit) -> 
  (Eff (ajax :: AJAX | e) Unit)


