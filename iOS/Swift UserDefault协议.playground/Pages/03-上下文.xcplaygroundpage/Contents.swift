//: [Previous](@previous)

import Foundation


protocol BoolUserDefaultable {
    associatedtype BoolDefaultKey: RawRepresentable
}

extension BoolUserDefaultable where BoolDefaultKey.RawValue == String {
    
    static func set(_ value: Bool, forKey key: BoolDefaultKey) {
        let key = key.rawValue
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func bool(forKey key: BoolDefaultKey) -> Bool {
        let key = key.rawValue
        return UserDefaults.standard.bool(forKey: key)
    }
}

struct Account: BoolUserDefaultable {
    
    enum BoolDefaultKey: String {
        case isUserLoggedIn
    }
}

Account.set(true, forKey: .isUserLoggedIn)



//: [Next](@next)
