module Node.Events.EventEmitter where

import Foreign (Foreign)
import Effect (Effect)
import Node.Events.Event (Event)
import Node.Events.EventListener (EventListener, toEventListener)
import Undefined (undefined)

class EventEmitter emitter where
    on
        :: forall listener
        .  Event emitter listener
        -> EventListener listener
        -> emitter
        -> Effect emitter
    once
        :: forall listener
        .  Event emitter listener
        -> EventListener listener
        -> emitter
        -> Effect emitter
    prependListener
        :: forall listener
        .  Event emitter listener
        -> EventListener listener
        -> emitter
        -> Effect emitter
    prependOnceListener
        :: forall listener
        .  Event emitter listener
        -> EventListener listener
        -> emitter
        -> Effect emitter
    removeListener
        :: forall listener
        .  Event emitter listener
        -> EventListener listener
        -> emitter
        -> Effect emitter
    removeAllListeners
        :: forall listener
        .  Event emitter listener
        -> emitter
        -> Effect emitter
    emit
        :: forall listener
        .  Event emitter listener
        -> Array Foreign
        -> emitter
        -> Effect Boolean
    listeners
        :: forall listener
        .  Event emitter listener
        -> emitter
        -> Effect (Array (EventListener listener))
    listenerCount
        :: forall listener
        .  Event emitter listener
        -> emitter
        -> Effect Int
    getMaxListeners
        :: emitter
        -> Effect Int
    setMaxListeners
        :: Int
        -> emitter
        -> Effect emitter
    eventNames
        :: emitter
        -> Effect (Array String)

foreign import defaultOn
    :: forall listener emitter
    .  Event emitter listener
    -> EventListener listener
    -> emitter
    -> Effect emitter

foreign import defaultOnce
    :: forall listener emitter
    .  Event emitter listener
    -> EventListener listener
    -> emitter
    -> Effect emitter

foreign import defaultPrependListener
    :: forall listener emitter
    .  Event emitter listener
    -> EventListener listener
    -> emitter
    -> Effect emitter

foreign import defaultPrependOnceListener
    :: forall listener emitter
    .  Event emitter listener
    -> EventListener listener
    -> emitter
    -> Effect emitter

foreign import defaultRemoveListener
    :: forall listener emitter
    .  Event emitter listener
    -> EventListener listener
    -> emitter
    -> Effect emitter

foreign import defaultRemoveAllListeners
    :: forall listener emitter
    .  Event emitter listener
    -> emitter
    -> Effect emitter

foreign import defaultEmit
    :: forall listener emitter
    .  Event emitter listener
    -> Array Foreign
    -> emitter
    -> Effect Boolean

foreign import defaultListeners
    :: forall listener emitter
    .  Event emitter listener
    -> emitter
    -> Effect (Array (EventListener listener))

foreign import defaultListenerCount
    :: forall listener emitter
    .  Event emitter listener
    -> emitter
    -> Effect Int

foreign import defaultGetMaxListeners
    :: forall emitter
    .  emitter
    -> Effect Int

foreign import defaultSetMaxListeners
    :: forall emitter
    .  Int
    -> emitter
    -> Effect emitter

foreign import defaultEventNames
    :: forall emitter
    .  emitter
    -> Effect (Array String)

on'
    :: forall listener emitter
    .  EventEmitter emitter
    => Event emitter listener
    -> listener
    -> emitter
    -> Effect emitter
on' event listener emitter =
    on event (toEventListener listener) emitter

once'
    :: forall listener emitter
    .  EventEmitter emitter
    => Event emitter listener
    -> listener
    -> emitter
    -> Effect emitter
once' event listener emitter =
    once event (toEventListener listener) emitter

prependListener'
    :: forall listener emitter
    .  EventEmitter emitter
    => Event emitter listener
    -> listener
    -> emitter
    -> Effect emitter
prependListener' event listener emitter =
    prependListener event (toEventListener listener) emitter

prependOnceListener'
    :: forall listener emitter
    .  EventEmitter emitter
    => Event emitter listener
    -> listener
    -> emitter
    -> Effect emitter
prependOnceListener' event listener emitter =
    prependOnceListener event (toEventListener listener) emitter

removeAllListeners_
    :: forall emitter
    .  EventEmitter emitter
    => emitter
    -> Effect emitter
removeAllListeners_ emitter = removeAllListeners undefined emitter
