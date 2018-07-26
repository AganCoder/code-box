//
//  Share.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/25.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation

protocol Shareable {
    var keys: [SharedKey] { get }
}

public enum SharedKey: String {
    
    case userInfo
    
    case text
    
    case messageId
    
    case title
    
    case desc
    
    case thumbnailableImage
    
    case data
    
    case audioUrl
    
    case audioDataUrl
    
    case videoUrl
    
    case videoDataUrl
    
    case webPageUrl
}

extension SharedKey: Hashable {
    
    public static func == (lhs: SharedKey, rhs: SharedKey) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}





class TextMessage: Message {
    
    var text: String?
}

class MediaMessage: Message {
    
    var messageId: String?
    var title: String?
    var desc: String?
    var thumbnailableImage: UIImage?
}

class ImageMessage: MediaMessage {
    var data: Data?
}

class AudioMessage: MediaMessage {
    var audioUrl: String?
    var audioDataUrl: String?
}

class VideoMessage: MediaMessage {
    
    var videoUrl: String?
    
    var videoDataUrl: String?
}

class PageMessage: MediaMessage {
    
    var webPageUrl: String?
}


