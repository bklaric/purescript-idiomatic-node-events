module Node.Events.EventEmitter where

import Control.Monad.Effect (Effect)
import Node.Events (Event)
import Node.Events.EventListener (EventListener, toEventListener)

class EventEmitter emitter where
    on :: forall listener.
        Event listener -> EventListener listener -> emitter -> Effect emitter
    once :: forall listener.
        Event listener -> EventListener listener -> emitter -> Effect emitter
    prependListener :: forall listener.
        Event listener -> EventListener listener -> emitter -> Effect emitter
    prependOnceListener :: forall listener.
        Event listener -> EventListener listener -> emitter -> Effect emitter

foreign import defaultOn :: forall emitter listener.
    Event listener -> EventListener listener -> emitter -> Effect emitter

foreign import defaultOnce :: forall emitter listener.
    Event listener -> EventListener listener -> emitter -> Effect emitter

foreign import defaultPrependListener :: forall emitter listener.
    Event listener -> EventListener listener -> emitter -> Effect emitter

foreign import defaultPrependOnceListener :: forall emitter listener.
    Event listener -> EventListener listener -> emitter -> Effect emitter

on' :: forall listener emitter. EventEmitter emitter =>
    Event listener -> listener -> emitter -> Effect emitter
on' event listener emitter =
    on event (toEventListener listener) emitter

once' :: forall listener emitter. EventEmitter emitter =>
    Event listener -> listener -> emitter -> Effect emitter
once' event listener emitter =
    once event (toEventListener listener) emitter

prependListener' :: forall listener emitter. EventEmitter emitter =>
    Event listener -> listener -> emitter -> Effect emitter
prependListener' event listener emitter =
    prependListener event (toEventListener listener) emitter

prependOnceListener' :: forall listener emitter. EventEmitter emitter =>
    Event listener -> listener -> emitter -> Effect emitter
prependOnceListener' event listener emitter =
    prependOnceListener event (toEventListener listener) emitter

addListener :: forall listener emitter. EventEmitter emitter =>
    Event listener -> EventListener listener -> emitter -> Effect emitter
addListener = on

addListener' :: forall listener emitter. EventEmitter emitter =>
    Event listener -> listener -> emitter -> Effect emitter
addListener' = on'
