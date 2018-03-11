module Node.Events.EventEmitter.Events where

import Prelude

import Control.Monad.Effect (Effect)
import Data.Foreign (Foreign)
import Node.Events (Event(..))
import Node.Events.EventListener (EventListener)

newListener :: Event (Event Foreign -> EventListener Foreign -> Effect Unit)
newListener = Event "newListener"

removeListener :: Event (Event Foreign -> EventListener Foreign -> Effect Unit)
removeListener = Event "removeListener"
