//
//  Dissolve.swift
//  TransitionAnimators
//
//  Created by Enjoy on 2018/8/30.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation
import UIKit

open class DissolveAnimator: TransitionAnimator {
    
    let duration: TimeInterval
    
    public required init(duration: TimeInterval = 0.3) {
        self.duration = duration
        super.init()
    }
    
    
    public static func makeDissolveAnimator(_ duration: TimeInterval) -> AbstractTransitionAnimator {
        
        return BasicTransitionAnimator(duration: duration).initial { container, from, to in
            
            guard let to = to else { return }
            
            from?.setViewFromStart()
            to.setViewToEnd()
            to.view.alpha = 0.0
            
            container.bringSubviewToFront(to.view)
            
            }.transit { container, from, to in
                
                guard let to = to else { return }
                
                to.view.alpha = 1.0
                
            }.end { container, from, to in
                
                guard let to = to else { return }
                
                to.view.alpha = 1.0
        }
    }
}


extension DissolveAnimator {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {        
        return DissolveAnimator.makeDissolveAnimator(self.duration)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DissolveAnimator.makeDissolveAnimator(self.duration).reversed
    }
}
