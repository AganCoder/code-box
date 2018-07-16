import UIKit

struct Constant {
    enum Account: String {
        case isUserLoggedIn
    }
    
    private init() {}
}

UserDefaults.standard.set(true, forKey: Constant.Account.isUserLoggedIn.rawValue)

let isLoggedIn = UserDefaults.standard.bool(forKey: Constant.Account.isUserLoggedIn.rawValue)


// 目标
// UserDefaults.standard.set(true, forKey: .isUserLoggedIn)

