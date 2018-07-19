module Node.Events.EventEmitter.Events where

import Prelude

import Foreign (Foreign)
import Effect (Effect)
import Node.Events.Event (Event(..))
import Node.Events.EventEmitter (class EventEmitter)
import Node.Events.EventListener (EventListener)

newListener :: forall emitter. EventEmitter emitter =>
    Event emitter
        (Event emitter Foreign -> EventListener Foreign -> Effect Unit)
newListener = Event "newListener"

removeListener :: forall emitter. EventEmitter emitter =>
    Event emitter
        (Event emitter Foreign -> EventListener Foreign -> Effect Unit)
removeListener = Event "removeListener"
