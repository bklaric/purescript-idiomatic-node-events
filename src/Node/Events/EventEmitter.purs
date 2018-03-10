module Node.Events.EventEmitter where

import Control.Monad.Effect (Effect)
import Node.Events (Event)

foreign import data EventListener :: Type -> Type

foreign import toEventListener :: forall listener.
    listener -> EventListener listener

class EventEmitter emitter where
    on :: forall listener.
        Event listener -> EventListener listener -> emitter -> Effect emitter

foreign import defaultOn :: forall emitter listener.
    Event listener -> EventListener listener -> emitter -> Effect emitter

on' :: forall emitter listener. EventEmitter emitter =>
    Event listener -> listener -> emitter -> Effect emitter
on' event listener emitter =
    on event (toEventListener listener) emitter
