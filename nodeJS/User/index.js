const express = require("express")
const bodyParser = require("body-parser")
const tool = require("./Tools/tool")
const UserError = require("./error/UserError")
const mysql =require("mysql")

var connect = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: "root123456",
    database: 'ezinfo'
})
// connect.connect()

var sql = "Select * from User";
connect.query(sql, function (error, results, fields) {

    if (error) {
        console.log(error)
        return       
    }
    console.log("result: ", results)
})


const app = express()

app.use(express.static("public"))
app.use(bodyParser.json()) // parsing Json
app.use(bodyParser.urlencoded({ extended: true })) // // for parsing application/x-www-form-urlencode

app.get("/verifyCode", function (req, res) {    
    const query = req.query
    const phoneNumber = query.phoneNumber

    // 检查验证码是否有效
    if (tool.isAvaildPhoneNumber(phoneNumber) == false) {
        res.status(200).send({
            success: false,
            message: UserError.infos[UserError.InvalidPhoneNumber].message
        })     
        res.end()
        return 
    }

    // 2. 检查改用户是否已经注册过

    // 3. 发送验证码
    res.send("abcdefthi")
})

app.post("/register", function (req, res, next)  {
    var body = req.body
    console.log(body); 
    res.send(body)
    res.end()
})
 
app.listen(9090)

console.log("Start Server, Port is ", 9090)

