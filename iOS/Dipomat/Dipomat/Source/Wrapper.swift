//
//  Wrapper.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/24.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation

class Wrapper: NSObject {
    
    var info: SocialInfo?
    
    required init(info: SocialInfo) {
        self.info = info
        super.init()
    }
}

extension Wrapper: Proxy{
    
    @objc func handleOpenUrl(with url: URL) -> Bool {
        return false
    }
    
    @objc var isInstalled: Bool { return false }
    
    @objc func register() {}
    
    @objc func auth(compplete: @escaping (String) -> Void) {}
}
