'use strict'

// 原型模式
function Person() {}

// function person() {}
// 每个函数都有一个原型(prototype)属性
// person.prototype.name = "xxx"


Person.prototype.name = "Nicholas"
Person.prototype.age = 29
Person.prototype.job = "SoftWare Enginee"
Person.prototype.sayName = function() {
    console.log(this.name)
}

var person1 = new Person()
person1.sayName() // Nicholas

var person2 = new Person() 
person2.sayName() // Nicholas

console.log(person1.constructor == person2.constructor)


// 1. 理解原型对象: 每个函数才有原型对象
// prototype 指向的是 Person对象
console.log(Person.prototype);

// Person.prototype.constructor 指向的是 function Person
console.log(Person.prototype.constructor);

console.log(Person.prototype.isPrototypeOf(person1)); // true

console.log(Object.getPrototypeOf(person1) == Person.prototype);

console.log(person1.constructor);



