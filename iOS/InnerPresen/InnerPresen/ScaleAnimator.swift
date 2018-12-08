//
//  ScaleAnimator.swift
//  EZTransitionAnimator
//
//  Created by Enjoy on 2018/8/31.
//

import Foundation
import UIKit

open class ScaleAnimator: TransitionAnimator {
    
    let duration: TimeInterval
    let sx: CGFloat
    let sy: CGFloat
    
    public required init(duration: TimeInterval = 0.3, sx: CGFloat = 1.2, sy: CGFloat = 1.2) {
        self.duration = duration
        self.sx = sx
        self.sy = sy
        super.init()
    }
    
    public static func makeScaleAndFadeInAnimator(_ duration: TimeInterval, sx: CGFloat, sy: CGFloat) -> AbstractTransitionAnimator {
        
        return BasicTransitionAnimator(duration: duration).initial { container, from, to in
            
            guard let to = to else { return }
            
            from?.setViewFromStart()
            
            to.view.alpha = 0.0
            to.view.transform = CGAffineTransform(scaleX: sx, y: sy)
            
            container.bringSubviewToFront(to.view)
            
            }.transit { container, from, to in
                
                guard let to = to else { return }
                
                to.view.transform = CGAffineTransform.identity
                to.view.alpha = 1.0
                
            }.end { container, from, to in
                
                to?.setViewToEnd()
                to?.view.transform = CGAffineTransform.identity
                to?.view.alpha = 1.0
//                UIView.animate(withDuration: 2, animations: {
//                    
//                })
        }
    }
    
    public static func makeScaleAndFadeOutAnimator(_ duration: TimeInterval = 0.3, sx: CGFloat = 1.2, sy: CGFloat = 1.2) -> AbstractTransitionAnimator {
        
        return self.makeScaleAndFadeInAnimator(duration, sx: sx, sy: sy).reversed
    }
}


extension ScaleAnimator {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ScaleAnimator.makeScaleAndFadeInAnimator(self.duration, sx: sx, sy: sy)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ScaleAnimator.makeScaleAndFadeOutAnimator(self.duration, sx: sx, sy: sy)
    }
}
