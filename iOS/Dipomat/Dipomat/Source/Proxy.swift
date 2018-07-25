//
//  Proxy.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/24.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation

protocol Proxy: NSObjectProtocol {
    
    var isInstalled: Bool { get }
    
    func register()
    
    func handleOpenUrl(with url: URL) -> Bool
    
    // 授权信息 瞎写的 可以进行授权设置
    func auth(compplete: @escaping (String) -> Void)
    
}
