//
//  Wrapper.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/24.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation

class Wrapper: NSObject, Proxy {
    
    var info: SocialInfo?
    
    required init(info: SocialInfo) {
        self.info = info
        super.init()
    }
    
    func handleOpenUrl(with url: URL) -> Bool {
        return false
    }
    
    var isInstalled: Bool { return false }
    
    func register() {}
    
    func auth(complete: @escaping (Result<User, RError>) -> Void) { }
    
    func shareMessage(with: Message) {}
}

