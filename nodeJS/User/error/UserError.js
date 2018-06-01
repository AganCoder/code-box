// 枚举使用
// See: https://www.jianshu.com/p/76fc5ffa9279

var UserError = {
    InvalidPhoneNumber: 0,
    WrongVerifyCode: 1,
    PhoneNumberExist: 2,
    PhoneNumberOrCodeWrong: 3,
    PasswordCanNotNull: 4,
    infos: {
        0: { message: "无效的手机号码,请输入正确的手机号"},
        1: { message: "验证码错误"},
        2: { message: "手机号码已存在,请直接登录" },
        3: { message: "手机号或者验证码错误"},
        4: { message: "密码不能为空"}
    }
}

Object.freeze(UserError)

exports = module.exports = UserError
