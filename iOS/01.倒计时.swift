//
//  ViewController.swift
//  01-倒计时
//
//  Created by Enjoy on 2018/8/14.
//  Copyright © 2018 enjoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: DispatchSourceTimer?
    
    var time: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let concurrentQueue = DispatchQueue(label: "io.githuh.rsenjoyer.DispatchSourceTimer", attributes: .concurrent)
        timer = DispatchSource.makeTimerSource(queue: concurrentQueue)
        timer?.schedule(deadline: .now(), repeating: 1)
        
        
        
        timer?.setEventHandler(handler: {
            if self.time == 0 {
                self.timer?.cancel()
                return
            }
            print(self.time)
            self.time -= 1
        })
        
        timer?.setCancelHandler(handler: {
            print("cancle")
        })
        
        timer?.resume()
    }


}

