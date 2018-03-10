module Node.Events.EventListener where

foreign import data EventListener :: Type -> Type

foreign import toEventListener :: forall listener.
    listener -> EventListener listener
