module Node.Events.EventEmitter where

import Prelude

import Control.Monad.Eff (Eff, kind Effect)
import Control.Monad.Eff.Console (CONSOLE, log)

foreign import data EVENTS :: Effect

newtype Event callback (effects :: # Effect) = Event String
-- data Event callback (effects :: # Effect) =
--     EventName String
--     | EventSymbol JsSymbol

error :: forall effects. Event (String -> String -> Int -> Eff effects Unit) effects
error = Event "nigga"

foreign import data EventCallback :: Type -> Type -> # Effect -> Type

foreign import toEventCallback :: forall event callback effects.
    callback -> EventCallback event callback effects

class EventEmitter emitter where
    on :: forall callback effects.
        Event callback effects ->
        callback ->
        emitter ->
        Eff (events :: EVENTS | effects) Unit
    on' :: forall event callback effects.
        Event callback effects ->
        EventCallback event callback effects ->
        emitter ->
        Eff (events :: EVENTS | effects) Unit

foreign import defaultOn
    :: forall emitter callback effects
    .  Event callback effects
    -> callback
    -> emitter
    -> Eff (events :: EVENTS | effects) Unit

foreign import defaultOn_
    :: forall emitter effects event callback. Event callback effects -> EventCallback event callback effects -> emitter -> Eff (events :: EVENTS | effects) Unit

data Fake

instance eventEmitterFake :: EventEmitter Fake where
    on = defaultOn
    on' = defaultOn_

foreign import undefined :: forall a. a

hm :: Fake
hm = undefined

aaa :: forall t45.
  Eff
    ( events :: EVENTS
    , console :: CONSOLE
    | t45
    )
    Unit
aaa = on error (\first second integer -> log "afdadsf") hm

testCallback :: forall t1 t10 t3.
  EventCallback t3
    (String
     -> String
        -> Int
           -> Eff
                ( console :: CONSOLE
                | t10
                )
                Unit
    )
    t1
testCallback = toEventCallback \(first :: String) (second :: String) (integer :: Int) -> log "holy shit"

asdf :: forall t32.
  Eff
    ( events :: EVENTS
    , console :: CONSOLE
    | t32
    )
    Unit
asdf = on' error (toEventCallback \first second integer -> log "holy shit") hm

-- lolwut :: forall t27.
--   Eff
--     ( events :: EVENTS
--     , console :: CONSOLE
--     | t27
--     )
--     Unit
lolwut :: forall t27.
  Eff
    ( events :: EVENTS
    , console :: CONSOLE
    | t27
    )
    Unit
lolwut = on' error testCallback hm
