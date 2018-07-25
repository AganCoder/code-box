//
//  SocialInfo.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/24.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation

class SocialInfo: Equatable {
    
    let type: Social
    let key: String
    let redirectUrl: String?
    let secret: String?
    
    init(type: Social, key: String, redirectUrl: String? = nil, secret: String? = nil) {
        self.type = type
        self.key = key
        self.redirectUrl = redirectUrl
        self.secret = secret
    }
    
    private var _wrapper: Wrapper? = nil
    var wrapper: Wrapper {
        
        if let wrapper = _wrapper  {
            return wrapper
        }
        
        _wrapper = self.type.wrapperType().init(info: self)
        
        return _wrapper!
    }
    
    public static func == (lhs: SocialInfo, rhs: SocialInfo) -> Bool {
        return lhs.type == rhs.type && lhs.key == rhs.key
    }    
}

