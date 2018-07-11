'use strict'

class Point {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }

    toString() {
        return `${this.x}, ${this.y}`
    }
}

let point = new Point(1, 2)
console.log(point.toString());




