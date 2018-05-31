// 枚举使用
// See: https://www.jianshu.com/p/76fc5ffa9279

var UserError = {
    InvalidPhoneNumber: 0,
    WrongVerifyCode: 1,
    infos: {
        0: { message: "无效的手机号码,请输入正确的手机号"},
        1: { message: "验证码错误"}
    }
}

Object.freeze(UserError)

exports = module.exports = UserError
