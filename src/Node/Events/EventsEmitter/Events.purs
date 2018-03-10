module Node.Events.EventEmitterEvents where

import Prelude

import Control.Monad.Effect (Effect)
import Node.Events (Event(..))
import Node.Events.EventListener (EventListener)

newListener :: forall listener.
    Event (Event listener -> EventListener listener -> Effect Unit)
newListener = Event "newListener"

removeListener :: forall listener.
    Event (Event listener -> EventListener listener -> Effect Unit)
removeListener = Event "removeListener"
