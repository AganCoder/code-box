//
//  QQ.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/24.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation

class QQ: Wrapper {
    
    override func register() {
        
        print("QQ Register")
    }
    
    override var isInstalled: Bool {
        print("isInstalled")
        return false
    }
}
