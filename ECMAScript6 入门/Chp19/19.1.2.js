'use strict'

class Point {

}

typeof Point // "function"
if (Point === Point.prototype.constructor) {
    console.log("True");    
}