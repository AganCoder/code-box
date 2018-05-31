const express = require("express")
const bodyParser = require("body-parser")
const tool = require("./Tools/tool")
const UserError = require("./model/UserError")

const app = express()

app.use(express.static("public"))
app.use(bodyParser.json()) // parsing Json
app.use(bodyParser.urlencoded({ extended: true })) // // for parsing application/x-www-form-urlencode

app.get("/verifyCode", function (req, res) {    
    // 接入短信验证码
    const query = req.query
    const phoneNumber = query.phoneNumber

    if (tool.isAvaildPhoneNumber(phoneNumber) == false) {
        res.status(200).send({
            success: false,
            message: "手机号码无效"
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
 
app.listen(8080)

console.log("Start Server, Port is ", 8080)

