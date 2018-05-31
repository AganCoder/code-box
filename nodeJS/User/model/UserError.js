const UserErrorEnum = {
    InvalidPhoneNumber: "无效的手机号码,请输入正确的手机号",
    WrongVerifyCode: "验证码错误",
}

Object.freeze(UserErrorEnum)

module.exports.UserErrorEnum = UserErrorEnum
