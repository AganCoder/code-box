//: [Previous](@previous)

import Foundation

protocol KeyNameSpaceable {}

extension KeyNameSpaceable {
    static func nameSpace<T>(_ key: T) -> String where T: RawRepresentable {
        return "\(type(of: Self.self)).\(key.rawValue)"
    }
}


protocol BoolUserDefaultable: KeyNameSpaceable {
    associatedtype BoolDefaultKey: RawRepresentable
}

extension BoolUserDefaultable where BoolDefaultKey.RawValue == String {
    
    static func set(_ value: Bool, forKey key: BoolDefaultKey) {
        let key = nameSpace(key)
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func bool(forKey key: BoolDefaultKey) -> Bool {
        let key = nameSpace(key)
        return UserDefaults.standard.bool(forKey: key)
    }
}

extension UserDefaults {
    struct Account: BoolUserDefaultable {
        
        enum BoolDefaultKey: String {
            case isUserLoggedIn
        }
    }
}

UserDefaults.Account.set(true, forKey: .isUserLoggedIn)


//: [Next](@next)
