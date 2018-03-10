"use strict";

exports.toEventListener = function (listener) {
    return function () { // This function receives all event arguments.
        const argumentsArray = Array.from(arguments)
        var listenerResult = listener
        for (var index = 0; index < argumentsArray.length; ++index) {
            listenerResult = listenerResult(argumentsArray[index])
        }
        listenerResult()
    }
}
