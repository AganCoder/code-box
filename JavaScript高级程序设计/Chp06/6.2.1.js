'use strict'
// 工程模式

function  createPerson(name, age, job) {
    var person = new Object()
    person.name = name
    person.age = age
    person.job = job
    person.sayName = function () {
        console.log(this.name)
    }

    return person
}

var person1 = createPerson("Nicholas", 29, "SoftWare Engineer")
var person2 = createPerson("Greg", 27, "Doctor")

console.log(person1)
console.log(person2)

// 没有解决对象识别问题， 无法知道 person1 与 person2 的类型