'use strict'

{
  let a = 10;
  var b = 1;
}
// a 
console.log(b);

// i 作用域尽在 for 循环代码块
for (let i=0; i<10; i++) {}

var a = [];
for (var i=0; i<10; i++) {
  a[i] = function () {
    console.log(i);    
  }
}

a[6](); // 10


var a = []
for (let i=0; i<10; i++) {
  a[i] = function () {
    console.log(i);    
  }
}

// 变量i是let声明的，当前的i只在本轮循环有效
// 所以每一次循环的i其实都是一个新的变量，所以最后输出的是6
a[6]();  // 6

// for循环还有一个特别之处
// 就是设置循环变量的那部分是一个父作用域，而循环体内部是一个单独的子作用域。
for (let i=0; i<3; i++) {
  let i = "abc";
  console.log(i);
}
