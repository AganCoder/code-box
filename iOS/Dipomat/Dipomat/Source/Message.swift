//
//  Message.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/26.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation

protocol Message: Shareable {
    
    var userInfo: [AnyHashable: Any]? { get set }
    
    var text: String? { get set }
    
    var messageId: String? { get set }
    
    var title: String? { get set }
    
    var desc: String? { get  set }
    
    var thumbnailableImage: UIImage? { get set }
    
    var data: Data? { get set }
    
    var audioUrl: String? { get set }
    
    var audioDataUrl: String? { get set }
    
    var videoUrl: String? { get set }
    
    var videoDataUrl: String? { get set }
    
    var webPageUrl: String? { get set }
}

extension Message {
    
}

extension Message {
    

    
    var userInfo: [AnyHashable: Any]? {
        get { return nil }
        set {}
    }
    
    var text: String? {
        get { return nil }
        set {}
    }
    
    var messageId: String? {
        get { return nil }
        set {}
    }
    
    var title: String? {
        get { return nil }
        set {}
    }
    
    var desc: String? {
        get { return nil }
        set {}
    }
    
    var thumbnailableImage: UIImage? {
        get { return nil }
        set {}
    }
    
    var data: Data? {
        get { return nil }
        set {}
    }
    
    var audioUrl: String? {
        get { return nil }
        set {}
    }
    
    var audioDataUrl: String? {
        get { return nil }
        set {}
    }
    
    var videoUrl: String? {
        get { return nil }
        set {}
    }
    
    var videoDataUrl: String? {
        get { return nil }
        set {}
    }
    
    var webPageUrl: String? {
        get { return nil }
        set {}
    }
}
