'use strict'

const PI = 3.1415;
console.log(PI);

// PI = 3; // TypeError: Assignment to constant variable.

// const一旦声明变量，就必须立即初始化，不能留到以后赋值。
// const foo; //SyntaxError: Missing initializer in const declaration

const foo = {}
foo.prop = 123;

console.log(foo.prop);
// foo = {}   // TypeError: Assignment to constant variable.

const a = []
a.push("hello")
a.length = 0;
console.log(a);

// a = ['Dave'] // TypeError: Assignment to constant variable.


