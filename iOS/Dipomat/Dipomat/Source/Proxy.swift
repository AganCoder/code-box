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
    
    func auth(complete: @escaping(Result<User, RError>) -> Void)
    
    func shareMessage(with: Message)
    
}
