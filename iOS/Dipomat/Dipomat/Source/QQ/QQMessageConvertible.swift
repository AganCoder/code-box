//
//  QQMessageConvertible.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/26.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation

public enum QQMessageType {
    case text
    case image
    case audio
    case video
    case page
}

protocol QQMessageConvertible {
    
    var type: QQMessageType { get }
    
    func asQQMessage() -> QQApiObject
    
}

extension TextMessage: QQMessageConvertible {
    
    var type: QQMessageType { return .text }
    
    func asQQMessage() -> QQApiObject {
        
        let textObject = QQApiTextObject(text: self.text!)
        return textObject!
    }
}

extension ImageMessage: QQMessageConvertible {
    
    var type: QQMessageType { return .image }
    
    func asQQMessage() -> QQApiObject {
        
        let textObject = QQApiTextObject(text: self.text!)
        return textObject!
    }
}


extension AudioMessage: QQMessageConvertible {
    
    var type: QQMessageType { return .audio }
    
    func asQQMessage() -> QQApiObject {
        
        let textObject = QQApiTextObject(text: self.text!)
        return textObject!
    }
}


extension VideoMessage: QQMessageConvertible {
    
    var type: QQMessageType { return .video }
    
    func asQQMessage() -> QQApiObject {
        
        let textObject = QQApiTextObject(text: self.text!)
        return textObject!
    }
}


extension PageMessage: QQMessageConvertible {
    
    var type: QQMessageType { return .page }
    
    func asQQMessage() -> QQApiObject {
        
        let textObject = QQApiTextObject(text: self.text!)
        return textObject!
    }
}
