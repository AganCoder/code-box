//
//  UI+Utility.swift
//  EZTransitionAnimator
//
//  Created by Enjoy on 2018/8/31.
//

import Foundation
import UIKit
import CoreGraphics

extension UIRectEdge {
    
    var normalizedOffset: CGVector {
        
        var vector = CGVector(dx: 0.0, dy: 0.0)
        
        if self.contains(UIRectEdge.top) {
            vector.dy -= 1
        }
        if self.contains(UIRectEdge.bottom) {
            vector.dy += 1
        }
        if self.contains(UIRectEdge.left) {
            vector.dx -= 1
        }
        if self.contains(UIRectEdge.right) {
            vector.dx += 1
        }
        return vector
    }
}

prefix func -(edge: UIRectEdge) -> UIRectEdge {
    
    var reval = UIRectEdge()
    if edge.contains(UIRectEdge.top) {
        reval.insert(UIRectEdge.bottom)
    }
    if edge.contains(UIRectEdge.bottom) {
        reval.insert(UIRectEdge.top)
    }
    if edge.contains(UIRectEdge.left) {
        reval.insert(UIRectEdge.right)
    }
    if edge.contains(UIRectEdge.right) {
        reval.insert(UIRectEdge.left)
    }
    return reval
}

extension CGRect {
    
    func offsetBy(_ normalized: CGVector) -> CGRect {
        
        return self.offsetBy(dx: self.width * normalized.dx, dy: self.height * normalized.dy)
    }
    
    mutating func offsetInPlace(_ normalized: CGVector) {
        
        self = self.offsetBy(normalized)
    }
}
