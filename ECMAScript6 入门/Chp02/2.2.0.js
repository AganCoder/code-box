'use strict'

var tmp = new Date();

function f() {
  console.log(tmp); // undefined
  if (false) {
    var tmp = 'hello world';
  }
}

f();


// ES6 let 增加了块级作用域
function f1() {
  let n = 5;
  if (true) {
    let n = 10;
  }
  console.log(n); // 5
}

