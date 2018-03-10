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
