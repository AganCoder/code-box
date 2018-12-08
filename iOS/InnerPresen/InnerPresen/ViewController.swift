//
//  ViewController.swift
//  InnerPresen
//
//  Created by enjoy on 2018/12/6.
//  Copyright © 2018 enjoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func present(_ sender: Any) {
        guard let second = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else {
            return
        }
        second.modalPresentationStyle = .custom
        second.transitioningDelegate = self
        
        present(second, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}


extension ViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return InnerPresentationController(presentedViewController: presented, presenting: presenting).handleFrame({ (_, _) -> CGRect in
            
            return CGRect(x: 200, y: 100, width: 200, height: 200)
        })
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return ScaleAnimator.makeScaleAndFadeInAnimator(0.1, sx: 0.8, sy: 0.8)

    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ScaleAnimator.makeScaleAndFadeOutAnimator(0.1, sx: 0.8, sy: 0.8)
    }
}



class SecondViewController: UIViewController {
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
