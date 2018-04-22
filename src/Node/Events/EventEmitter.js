"use strict";

exports.defaultOn = function (event) {
    return function (listener) {
        return function (emitter) {
            return function () {
                return emitter.on(event, listener)
            }
        }
    }
}

exports.defaultOnce = function (event) {
    return function (listener) {
        return function (emitter) {
            return function () {
                return emitter.once(event, listener)
            }
        }
    }
}

exports.defaultPrependListener = function (event) {
    return function (listener) {
        return function (emitter) {
            return function () {
                return emitter.prependListener(event, listener)
            }
        }
    }
}

exports.defaultPrependOnceListener = function (event) {
    return function (listener) {
        return function (emitter) {
            return function () {
                return emitter.prependOnceListener(event, listener)
            }
        }
    }
}

exports.defaultRemoveListener = function (event) {
    return function (listener) {
        return function (emitter) {
            return function () {
                return emitter.removeListener(event, listener)
            }
        }
    }
}

exports.defaultRemoveAllListeners = function (event) {
    return function (emitter) {
        return function () {
            return emitter.removeAllListeners(event)
        }
    }
}

exports.defaultEmit = function (event) {
    return function (args) {
        return function (emitter) {
            return function () {
                return emitter.emit(event, args)
            }
        }
    }
}

exports.defaultListeners = function (event) {
    return function (emitter) {
        return function () {
            return emitter.listeners(event)
        }
    }
}

exports.defaultListenerCount = function (event) {
    return function (emitter) {
        return function () {
            return emitter.listenerCount(event)
        }
    }
}

exports.defaultGetMaxListeners = function (emitter) {
    return function () {
        return emitter.getMaxListeners()
    }
}

exports.defaultSetMaxListeners = function (listenerCount) {
    return function (emitter) {
        return function () {
            return emitter.setMaxListeners(listenerCount)
        }
    }
}

exports.defaultEventNames = function (emitter) {
    return function () {
        return emitter.eventNames()
    }
}
