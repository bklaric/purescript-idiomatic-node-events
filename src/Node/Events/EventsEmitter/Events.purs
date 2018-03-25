module Node.Events.EventEmitter.Events where

import Prelude

import Control.Monad.Effect.Exception (Error)
import Control.Monad.Effect (Effect)
import Data.Foreign (Foreign)
import Node.Events.Event (Event(..))
import Node.Events.EventEmitter (class EventEmitter)
import Node.Events.EventListener (EventListener)

error :: forall emitter. EventEmitter emitter =>
    Event emitter (Error -> Effect Unit)
error = Event "error"

newListener :: forall emitter. EventEmitter emitter =>
    Event emitter
        (Event emitter Foreign -> EventListener Foreign -> Effect Unit)
newListener = Event "newListener"

removeListener :: forall emitter. EventEmitter emitter =>
    Event emitter
        (Event emitter Foreign -> EventListener Foreign -> Effect Unit)
removeListener = Event "removeListener"
