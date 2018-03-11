module Node.Events where

import Prelude

import Control.Monad.Effect.Exception (Error)
import Control.Monad.Effect (Effect)

newtype Event listener = Event String

error :: Event (Error -> Effect Unit)
error = Event "error"
