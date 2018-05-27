'use strict'

var person = { }

Object.defineProperty(person, "name", {
    writable: false, // get only
    value: "Nicholas",
    configurable: false
});




for (var property in person) {
    console.log(property);
}

console.log(person.name);
// person.name = "Greg";
// delete person.name


var book  = {
    _year: 2004,
    edition: 1
}

Object.defineProperty(book, 'year', {
    get: function() {
        return this._year;
    },
    set: function (newValue) {
        console.log("set");
        
        this._year = newValue
        this.edition += newValue - 2004
    }
})
book.year = 2019
console.log(book.edition)




var book = {
    _year: 2004,
    edition: 1
}

book.__defineGetter__("year", function() {
    return this._year
})

book.__defineSetter__("year", function(newValue) {
    if (newValue > 2004) {
        this._year = newValue;
        this.edition = newValue - 2004
    }
})

book.year = 2018;
console.log(book.edition);



