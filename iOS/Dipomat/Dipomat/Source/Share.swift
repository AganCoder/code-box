//
//  Share.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/25.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation

public enum SharedKey: String {
    case title
}



extension SharedKey: Hashable {
    
    public static func == (lhs: SharedKey, rhs: SharedKey) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
