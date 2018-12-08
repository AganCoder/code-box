//
//  PanAnimator.swift
//  EZTransitionAnimator
//
//  Created by Enjoy on 2018/8/31.
//

import Foundation
import UIKit

open class PanAnimator: TransitionAnimator {
    
    let duration: TimeInterval
    let edge: UIRectEdge
    
    public required init(duration: TimeInterval = 0.3, from edge: UIRectEdge = .right) {
        self.duration = duration
        self.edge = edge
        super.init()
    }
    
    public static func makePanInAnimator(_ duration: TimeInterval, from edge: UIRectEdge) -> AbstractTransitionAnimator {
        
        return BasicTransitionAnimator(duration: duration).setAnimationOptions(.curveEaseOut).initial { container, from, to in
            
            guard let from = from, let to = to else { return }
            
            let offset = edge.normalizedOffset
            
            from.setViewFromStart()
            to.view.frame = from.initialFrame.offsetBy(offset)
            
            }.transit { container, from, to in
                
                guard let from = from, let to = to else { return }
                
                from.view.frame = from.initialFrame.offsetBy((-edge).normalizedOffset)
                to.setViewToEnd()
            }.end { container, from, to in
                guard let from = from, let to = to else { return }
                
                container.addSubview(from.view)
                container.bringSubviewToFront(from.view)
                
                to.setViewToEnd()
                from.setViewToEnd()
        }
    }
    
    public static func makePanOutAnimator(_ duration: TimeInterval, to edge: UIRectEdge) -> AbstractTransitionAnimator {
        
        return self.makePanInAnimator(duration, from: edge).reversed
    }
    
}

extension PanAnimator {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PanAnimator.makePanInAnimator(self.duration, from: self.edge)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PanAnimator.makePanOutAnimator(self.duration, to: self.edge)
    }
}
