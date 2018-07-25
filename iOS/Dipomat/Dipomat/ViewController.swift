//
//  ViewController.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/24.
//  Copyright © 2018 enjoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func tencentOAuth(_ sender: Any) {
        
        Manager.shared.auth(with: .qq) { (result) in
            print(result)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

