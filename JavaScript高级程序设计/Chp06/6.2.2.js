'use strict'

// 构造函数模式

function Person(name, age, job) {
    this.name = name;
    this.age = age;
    this.job = job;
    // this.sayName = function () {
    //     console.log(this.name)
    // }

    this.sayName = sayName
}

function sayName() {
    console.log(this.name)
}

// 当做构造函数使用
var person1 = new Person("Nicholas", 29, "SoftWare Engineer")
var person2 = new Person("Greg", 27, "Doctor")
person1.sayName();
person2.sayName()

// 作为普通函数使用
// Person("Greg", 27, "Doctor");
// window.sayName()

console.log(person1)
console.log(person2)

// 构造器方法
console.log(person1.constructor == Person);
console.log(person2.constructor == Person);

// instanceof
console.log(person1 instanceof Object)
console.log(person1 instanceof Person)



