//
//  BasicTransitionAnimator.swift
//  TransitionAnimators
//
//  Created by Enjoy on 2018/8/30.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation
import UIKit

public class BasicTransitionAnimator: AbstractTransitionAnimator {
    
    public override func copy(with zone: NSZone?) -> Any {
        guard let reval = super.copy(with: zone) as? BasicTransitionAnimator else {
            fatalError("Copy must be instance of BasicTransitionAnimator")
        }
        reval.animationOptions = self.animationOptions
        return reval
    }
    
    fileprivate var animationOptions: UIView.AnimationOptions = [.curveEaseInOut]
    
    public func setAnimationOptions(_ options: UIView.AnimationOptions) -> Self {
        self.animationOptions = options
        return self
    }
    
    public override func animating(with info: TransitionInfo, animation: @escaping () -> Void, completion: @escaping (Bool) -> Void) {
        
        UIView.animate(withDuration: self.duration, delay: 0.0, options: self.animationOptions, animations: animation, completion: completion)
    }
}
