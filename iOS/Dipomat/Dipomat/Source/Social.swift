//
//  Social.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/24.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation

enum Social {
    case qq
    case weChat
    case weibo
}

extension Social {
    
    func wrapperType() -> Wrapper.Type {
        switch self {
        case .qq:
            return QQ.self
        case .weChat:
            return Wechat.self
        case .weibo:
            return Weibo.self
        }
    }
}
