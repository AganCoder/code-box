//
//  Error.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/25.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation

public enum RError: Error {
    
    public enum OauthFailireReason {
        case urlRequestFailed
        case userInfoInValid
        case userCancelLogin
    }
    
    case netWorkLoss
    case OauthFail(reason: OauthFailireReason)
    case unKnown
}
