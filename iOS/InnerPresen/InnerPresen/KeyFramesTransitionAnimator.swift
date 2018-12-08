//
//  KeyFramesTransitionAnimator.swift
//  TransitionAnimators
//
//  Created by Enjoy on 2018/8/30.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation
import UIKit

public class KeyFramesTransitionAnimator: BasicTransitionAnimator {
    
    public override func copy(with zone: NSZone?) -> Any {
        guard let reval = super.copy(with: zone) as? KeyFramesTransitionAnimator else {
            fatalError("Copy must be instance of KeyFramesTransitionAnimator")
        }
        reval.keyFramesAnimationOptions = self.keyFramesAnimationOptions
        return reval
    }
    
    fileprivate var keyFramesAnimationOptions: UIView.KeyframeAnimationOptions = [.calculationModeCubic]
    
    public func setKeyFramesAnimationOptions(_ options: UIView.KeyframeAnimationOptions) -> Self {
        self.keyFramesAnimationOptions = options
        return self
    }
    
    public override func animating(with info: TransitionInfo, animation: @escaping () -> Void, completion: @escaping (Bool) -> Void) {
        
        UIView.animateKeyframes(withDuration: self.duration, delay: 0.0, options: self.keyFramesAnimationOptions, animations: animation, completion: completion)
    }
}
