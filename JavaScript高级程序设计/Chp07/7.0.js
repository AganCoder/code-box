'use strict'

// 函数声明
function functionName(arg0, arg1, arg2) {
    console.log(functionName.name);
}

functionName()

// 函数声明提升
sayHi()
function sayHi() {
    console.log("hi");
    
}


// 函数表达式 - 匿名函数
var functionName = function (arg0, arg1, arg2) {
    
};

var sayHi = null

if (true) {
    sayHi = function () {
        console.log("hi");        
    }
} else {
    sayHi = function() {
        console.log("Yo!");
        
    }
}


// 函数作为返回值
function craereComparisonFunction(propertyName) {
    return function(obj1, obj2) {
        var value1 =  obj1[propertyName];
        var value2 = obj2[propertyName];    

        if (value1 < value2) {
            return -1
        } else if (value1 > value2) {
            return 1
        } else {
            return 0
        }
    };
}

var compare = craereComparisonFunction("name")
var res = compare({
    name: "Enjoy"
}, {
    name: "Gx"
})

console.log(res);
