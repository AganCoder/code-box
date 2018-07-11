'use strict'

function Point(x, y) {
    this.x = x;
    this.y = y;
}

Point.prototype.toString = function () {
    return `(${this.x}, ${this.y})`;
}

let point = new Point(1, 2)
console.log(point.toString());


