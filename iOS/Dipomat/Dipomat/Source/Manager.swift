//
//  Manager.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/24.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation

class Manager {
    
    static let shared = Manager()
    
    // TODO: Set
    private var configurations: [SocialInfo] = []
    
    func register(with configurations: [SocialInfo]) {
        
        self.configurations = configurations
        
        configurations.forEach { $0.wrapper.register() }
    }
    
    func handleOpenUrl(with url: URL) -> Bool {
        
        let first = self.configurations.first { $0.wrapper.handleOpenUrl(with: url) }
        return first != nil
    }
    
    func auth(with type: Social, complete: @escaping(Result<User, RError>) -> Void) {
        
        let cInfo = self.configurations.reversed().first { $0.type == type }
        
        guard let info = cInfo else { return }
        
        info.wrapper.auth(complete: complete)
    }
    
    func shareMessage(with message: Message, to type: Social) {
        
        let cInfo = self.configurations.reversed().first { $0.type == type }
        
        guard let info = cInfo else { return }
        
        info.wrapper.shareMessage(with: message)
    }
}
