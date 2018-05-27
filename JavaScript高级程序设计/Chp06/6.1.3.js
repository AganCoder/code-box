'use strict'
var book = {}

Object.defineProperties(book, {
    _year: {
        writable: true,
        value: 2004
    },

    edition: {
        value: 1,
        configurable: true,
        enumerable: true
    },
    year: {
        configurable: true,
        enumerable: true,
        get: function() {
            return this._year;
        },
        set: function(newValue) {
            if (newValue > 2004) {
                this._year = newValue - 2004;
                this.edi
            }
        }
    }

})

var descriptor = Object.getOwnPropertyDescriptor(book, "year")
console.log(descriptor.value)
console.log(descriptor.configurable)
console.log(descriptor.enumerable)
console.log(descriptor.writable)
console.log(descriptor.get)
console.log(descriptor.set)