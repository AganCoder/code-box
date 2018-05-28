'use strict'

// 对象的解构赋值

// 对象的属性没有次序，变量必须与属性同名，才能取到正确的值。
let {foo, bar} = {foo: "aaa", bar: "bbb"}
console.log(foo);
console.log(bar);

let {baz} = {foo: "aaa", bar: "bbb"}
console.log(baz); // undefined


let obj = { first: 'hello', last: 'world' };
let { first: f, last: l } = obj;
console.log(f);
console.log(l);
