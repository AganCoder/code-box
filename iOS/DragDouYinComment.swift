//
//  TwoViewController.swift
//  PanGesture
//
//  Created by wave on 2018/8/13.
//  Copyright © 2018 wave. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static let Two = UIStoryboard(name: "TwoViewController", bundle: nil)
}

extension TwoViewController {
    class func make() -> TwoViewController? {
        return UIStoryboard.Two.instantiateInitialViewController() as? TwoViewController
    }
}

class TwoViewController: UIViewController {
    
    @IBOutlet weak var topHeaderLabel: UILabel!
    
    
    let items = ["1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(TwoViewController.handlerPanGesture(_:)))
        pan.delegate = self
        self.view.addGestureRecognizer(pan)
        
        self.tableView.delegate = self
    }
    
    var point = CGPoint()
    
    var originY: CGFloat = 0
    
    @objc func handlerPanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
    
        switch gestureRecognizer.state {
            
        case .began:
            self.point = gestureRecognizer.location(in: self.view.window)
            self.originY = self.view.frame.origin.y
            print(self.view.frame.origin.y)
            
        case .changed:
            let currentPoint = gestureRecognizer.location(in: self.view.window)
            let offsetY = currentPoint.y - self.point.y
            
            self.view.frame.origin.y = self.originY + offsetY
            
        case .ended:
            self.tableView.isScrollEnabled = true
            
        case .possible:
            break
        case .cancelled:
            break
        case .failed:
            break
        }
    }
}

extension TwoViewController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        guard let otherView = otherGestureRecognizer.view as? UITableView else { return false }
        
        if otherView.panGestureRecognizer.velocity(in: otherView).y > 0 {
            self.tableView.isScrollEnabled = false
        } else {
            self.tableView.isScrollEnabled = true
        }
        
        return false
    }
}

extension TwoViewController: UITableViewDelegate {
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        guard scrollView == self.tableView else { return }
    }
}



extension TwoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
}
