//
//  User.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/25.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation

protocol UserConvertible {
    func asUser() throws -> User
}


class User {
    
    var uid: String?
    
    var nickName: String?
    
    var accessToken: String?
    
    var avatar: String?

    var gender: String?
    
    var rawData: [AnyHashable: Any]?
}


