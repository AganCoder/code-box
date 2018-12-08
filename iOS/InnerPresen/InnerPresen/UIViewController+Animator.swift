//
//  UIViewController+Animator.swift
//  TransitionAnimators
//
//  Created by Enjoy on 2018/8/30.
//  Copyright © 2018 enjoy. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    static fileprivate var animatorAssociatedKey: Void?
    
    public var animator: TransitionAnimator? {
        get {
            return objc_getAssociatedObject(self, &UIViewController.animatorAssociatedKey) as? TransitionAnimator
        }
        set {
            defer {
                objc_setAssociatedObject(self, &UIViewController.animatorAssociatedKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            }            
            self.modalPresentationStyle = .custom
            self.transitioningDelegate = newValue
        }
    }
}
