'use strict'

var person = new Object()
person.name = "Nicholas"
person.age = 29
person.job = "Software Engineer"

person.sayName = function() {
    console.log(this.name)
}

var person = {
    name: "Nicholas",
    age: 29,
    job: "software Engineer",
    sayName: function () {
        console.log(this.name);
    }
}

console.log(person.name, person.age, person.job)
person.sayName()


for(var property in person) {
    console.log(property)
}