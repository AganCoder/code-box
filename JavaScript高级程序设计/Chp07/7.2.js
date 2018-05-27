'use strict'

// 闭包是指有权访问另一个函数作用于中的变量的函数

function createFunctions() {
    var result = new Array()

    for (var i = 0; i < 10; i++) {
        result[i] = function () {
            return i;
        }
    }
    console.log(i);
    return result
}

var result = createFunctions()

// for (var i=0; i<result.length; i++) {
//     var res = result[i];
//     console.log(res());  
// }


function add(number) {
    for (var j = 0; j < number; j++) {
        if (j < 10) {
            var i = 100
        }
    }

    console.log(i); // 100
    console.log(j); // 5
}


function add(number) {
    (function (num) {
        for (var j = 0; j < num; j++) {
            (function (params) {
                if (j < 10) {
                    var i = 100
                }
            })(j)
        }
    })(number)
    
    console.log(i); // 100
    console.log(j); // 5
}

add(5)