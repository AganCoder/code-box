'use strict'

let [foo = true] = [];
console.log(foo);

// 当一个数组成员严格等于undefined，默认值才会生效。
let [x, y = 'b'] = ['a', undefined]
console.log(x);
console.log(y);

// 内部使用严格相等运算符（===)
// 如果一个数组成员是null，默认值就不会生效，因为null不严格等于undefined。
let [p=1] = [null]
console.log(p); // null



