'use strict'

let [a, b, c] = [1, 2, 3]
console.log(a);
console.log(b);
console.log(c);

let [foo, [[bar], baz]] = [1, [[2], 3]];
console.log(foo);
console.log(bar);
console.log(baz);

let [, , third] = ["foo", "bar", "baz"];
console.log(third);

let [x, , y] = [1, 2, 3];
console.log(x); // 1
console.log(y); // 3

let [head, ...tail] = [1, 2, 3, 4];
console.log(head); // 1
console.log(tail); // [ 2, 3, 4 ]

let [p, q ,...z] = ['a'];
console.log(p); // a
console.log(q); // undefined
console.log(z); // []










