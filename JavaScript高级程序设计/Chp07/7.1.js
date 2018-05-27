'use strict'

// 递归
function factorial(num) {
    if (num <= 1) {
        return 1
    } else {
        // return num * factorial(num - 1)
        return num * factorial(num - 1)
    }
}

// arguments.callee 严格模式下会报错
function factorial(num) {
    if (num <= 1) {
        return 1
    } else {
        // return num * factorial(num - 1)
        return num * arguments.callee(num - 1)
    }
}

var factorial = (function f(num) {
    if (num <= 1) {
        return 1
    } else {
        return num * f(num - 1)
    }
})