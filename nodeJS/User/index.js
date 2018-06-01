const express = require("express")
const bodyParser = require("body-parser")
const tool = require("./Tools/tool")
const UserError = require("./error/UserError")
const mysql = require("mysql")
const util = require('util')


const db = mysql.createPool({
    host: '127.0.0.1',
    user: 'root',
    password: 'root123456',
    database: 'ezinfo'
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
    let sql = 'SELECT COUNT(ID) AS id FROM USER WHERE PHONENUMBER =' + phoneNumber;
    db.query(sql, function (error, data, fileds) {
        if (error) {
            res.status(500).send("服务器端内部错误").end()
            return
        }
        if (data[0].id != 0) {
            res.status(200).send({
                success: false,
                message: UserError.infos[UserError.PhoneNumberExist].message
            }).end()
            return
        }

        // 3. 发送验证码
        //  用一张表记录验证码,然后验证, 直接插入即可
        let code = "123456"
        var sql = "INSERT INTO TmpVerfiyCode(ID, PHONENUMBER, CODE) VALUES(0," + phoneNumber + ", " + code + ");";
        console.log(sql);
        

        db.query(sql,  function (error, data, fileds) {
            if (error) {
                res.status(500).send("服务器端内部错误").end()
                return
            }

            res.status(200).send({
                success: true,
                message: "验证码发送成功"
            }).end()
        });

    })
})

app.post("/register", function (req, res, next) {
    let body = req.body;
    const phoneNumber = body.phoneNumber;
    const code = body.code
    const password = body.password

    // 验证是否有对应的
    let sql = 'SELECT EXISTS(SELECT * FROM TmpVerfiyCode WHERE PHONENUMBER=' + phoneNumber + ' AND CODE=' + code + ') AS exist';
    console.log(sql);
    
    db.query(sql, function (error, data, fileds) {
        if (error) {
            console.log(error);
            return 
        }
        if (!data[0].exist) {
            // 表中不存在
            res.status(200).send({
                success: false,
                message: UserError.infos[UserError.PhoneNumberOrCodeWrong].message
            }).end() 
            return
        }

        if (password.length == 0) {
            res.status(200).send({
                success: false,
                message: UserError.infos[UserError.PasswordCanNotNull].message
            }).end()
            return 
        }

        // 写入到用户的数据库      
        let sql = util.format("INSERT INTO USER (ID, PHONENUMBER, PASSWORD) VALUES(0, %s, %s)", phoneNumber, password)
        db.query(sql, function (error, data, fileds) {
            if (error) {
                console.log("Exists Error");
                return                 
            }
            res.send({
                success: true,
                message: "注册成功"
            }).end()      
        })
    })


    
    
})

app.listen(9090)

console.log("Start Server, Port is ", 9090)

