module.exports.isAvaildPhoneNumber = function (phoneNumber) {
    const regx = /^[1][3,4,5,7,8][0-9]{9}$/;  
    return regx.test(phoneNumber)
}