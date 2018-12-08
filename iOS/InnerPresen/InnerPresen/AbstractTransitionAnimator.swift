//
//  AbstractTransitionAnimator.swift
//  TransitionAnimators
//
//  Created by Enjoy on 2018/8/30.
//  Copyright © 2018 enjoy. All rights reserved.
//

import UIKit

public struct TransitioningComponent {
    
    public let view: UIView
    public let viewController: UIViewController
    public let initialFrame: CGRect
    public let finalFrame: CGRect
    
    public func setViewFromStart() {
        view.frame = initialFrame
    }
    
    public func setViewToEnd() {
        view.frame = finalFrame
    }
    
    public var reversed: TransitioningComponent {
        return TransitioningComponent(view: self.view, viewController: self.viewController, initialFrame: self.finalFrame, finalFrame: self.initialFrame)
    }
}

extension TransitioningComponent {
    
    fileprivate init?(context: UIViewControllerContextTransitioning, forFromVC: Bool) {
        
        let vcKey: UITransitionContextViewControllerKey = forFromVC ?  UITransitionContextViewControllerKey.from : UITransitionContextViewControllerKey.to
        let vKey: UITransitionContextViewKey = forFromVC ? UITransitionContextViewKey.from : UITransitionContextViewKey.to
        
        guard let vc = context.viewController(forKey: vcKey), let view = context.view(forKey: vKey) else { return nil }
        
        self.init(view: view, viewController: vc, initialFrame: context.initialFrame(for: vc), finalFrame: context.finalFrame(for: vc))
    }
}



public typealias TransitionInfo = (container: UIView, fromComponent: TransitioningComponent?, toComponent: TransitioningComponent?)
public typealias TransitionHandler = (TransitionInfo) -> Void

extension AbstractTransitionAnimator {
    
    static let defaultInitialHanlder: TransitionHandler = { (arg) in
        
        let (_, from, to) = arg
        to?.setViewFromStart()
    }
    
    static let defaultTransitingnHandler: TransitionHandler = { (arg) in
        
        let (_, from, to) = arg
        to?.setViewToEnd()
    }
}


open class AbstractTransitionAnimator: NSObject {
    
    let duration: TimeInterval
    
    public required init(duration: TimeInterval) {
        self.duration = duration
        super.init()
    }
    
    fileprivate var initialHandler: TransitionHandler? = AbstractTransitionAnimator.defaultInitialHanlder
    
    fileprivate var transitingHandler: TransitionHandler?  = AbstractTransitionAnimator.defaultTransitingnHandler
    
    fileprivate var completionHandler: TransitionHandler? = AbstractTransitionAnimator.defaultTransitingnHandler
    
    public func initial(_ handler: TransitionHandler?) -> Self {
        self.initialHandler = handler
        return self
    }
    
    public func transit(_ handler: TransitionHandler?) -> Self {
        self.transitingHandler = handler
        return self
    }
    
    public func end(_ handler: TransitionHandler?) -> Self {
        self.completionHandler = handler
        return self
    }
    
    func makeTransitionInfo(with transitionContext: UIViewControllerContextTransitioning) -> TransitionInfo {
        
        let containerView = transitionContext.containerView
        
        let from = TransitioningComponent(context: transitionContext, forFromVC: true)
        let to = TransitioningComponent(context: transitionContext, forFromVC: false)
        
        if let toView = to?.view, toView.superview != containerView {
            containerView.addSubview(toView)
        }
        
        self.initialHandler?((container: containerView, fromComponent: from, toComponent: to))
        
        return (container: containerView, fromComponent: from, toComponent: to)
    }
    
    open func animating(with info: TransitionInfo, animation: @escaping () -> Void, completion: @escaping (Bool) -> Void) {
        
        fatalError("Not implemented")
    }
    
}

extension AbstractTransitionAnimator: UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let info = self.makeTransitionInfo(with: transitionContext)
        
        self.animating(with: info, animation: {
            
            self.transitingHandler?(info)
        }, completion: { finish in
            
            let wasCancelled = transitionContext.transitionWasCancelled
            
            if wasCancelled && info.toComponent?.view == info.container {
                info.toComponent?.view.removeFromSuperview()
            }
            
            self.completionHandler?(info)
            
            transitionContext.completeTransition(!wasCancelled)
        })
    }

}

extension AbstractTransitionAnimator: NSCopying {
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let reval = type(of: self).init(duration: self.duration)
        
        reval.initialHandler = self.initialHandler
        reval.transitingHandler = self.transitingHandler
        reval.completionHandler = self.completionHandler
        
        return reval
    }
    
    public var reversed: AbstractTransitionAnimator {
        
        guard let copy = self.copy() as? AbstractTransitionAnimator else {
            fatalError("Copy must be instance of AbstractTransitionAnimator")
        }
        
        if let transitingHandler = self.transitingHandler {
            copy.initialHandler = { (arg) in
                
                let (container, from, to) = arg
                
                transitingHandler((container: container, fromComponent: to?.reversed, toComponent: from?.reversed))
            }
        } else {
            copy.initialHandler = nil
        }
        
        if let initialHandler = self.initialHandler {
            copy.transitingHandler = { (arg) in
                let (container, from, to) = arg
                initialHandler((container: container, fromComponent: to?.reversed, toComponent: from?.reversed))
            }
        } else {
            copy.transitingHandler = nil
        }
        
        return copy
    }
}
