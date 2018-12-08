//
//  PushAnimator.swift
//  EZTransitionAnimator
//
//  Created by Enjoy on 2018/8/31.
//

import Foundation
import UIKit

open class PushAnimator: TransitionAnimator {
    
    let duration: TimeInterval
    let edge: UIRectEdge
    
    public required init(duration: TimeInterval = 0.3, from edge: UIRectEdge = .right) {
        self.duration = duration
        self.edge = edge
        super.init()
    }
    
    public static func makePushInAnimator(_ duration: TimeInterval, from edge: UIRectEdge) -> AbstractTransitionAnimator {
        
        return PanAnimator.makePanInAnimator(duration, from: edge)
    }
    
    public static func makePopInAnimator(_ duration: TimeInterval = 0.3, to edge: UIRectEdge = .right) -> AbstractTransitionAnimator {
        
        return BasicTransitionAnimator(duration: duration).setAnimationOptions(.curveEaseInOut).initial { container, from, to in
            
            guard let from = from, let to = to else { return }
            
            from.setViewFromStart()
            
            let offset = (-edge).normalizedOffset
            var frame = from.initialFrame.offsetBy(offset)
            frame.origin.x += frame.width / 3.0
            
            to.view.frame = frame
            
            container.addSubview(from.view)
            container.bringSubviewToFront(from.view)
            
            }.transit { container, from, to in
                
                guard let from = from, let to = to else { return }
                
                from.view.frame = from.initialFrame.offsetBy(edge.normalizedOffset)
                to.setViewToEnd()
        }
    }
    
}
