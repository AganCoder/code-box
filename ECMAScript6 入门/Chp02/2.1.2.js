'use strict'

// 暂时性死区

var tmp = 456

// 只要块级作用域内存在let命令，它所声明的变量就“绑定”（binding）这个区域，不再受外部的影响。

// ES6 明确规定，如果区块中存在let和const命令，这个区块对这些命令声明的变量，
// 从一开始就形成了封闭作用域。凡是在声明之前就使用这些变量，就会报错
if (true) {
  // tmp = "abcd"; // ReferenceError
  let tmp;
}

if (true) {
  // tmp = 'abc'; // ReferenceError
  // console.log(tmp); // ReferenceError

  let tmp;
  console.log(tmp);

  tmp = 123
  console.log(tmp);

}

function bar(x=y, y=2) {
  return [x, y];
}
// bar() // ReferenceError

function bar1(x=2, y=x) {
  return [x, y];
}

bar1()

function func() {
  let a = 10;
  var a = 1;   // Identifier 'a' has already been declared
}

function func1(arg) {
  {
    let arg
  }
}

func1()
