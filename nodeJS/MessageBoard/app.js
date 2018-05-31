const express = require("express")
const queryString = require("querystring")
const bodyParser = require("body-parser")

var app = express()

app.use(express.static("public"))

app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded


// app.get("/", function (req, res) {
//     var json = {
//         name: "enjoy",
//         age: 29
//     }
//     res.send(json)
// })

app.get("/submit", function (req, res) {
    console.log(req.url)
    console.log(req.query)
    res.send({
        name: "Helloworld",
        desc: "name desc"
    })
})

app.post("/submit", function (req, res) {
    console.log(req.body);
    res.send({ s: 1 })
})

app.listen("4000")
console.log("start server, listen poryt: ", 4000);