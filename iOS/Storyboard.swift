//
//  ViewController.swift
//  StoryBoardIdentifier
//
//  Created by Enjoy on 2018/9/6.
//  Copyright © 2018 enjoy. All rights reserved.
//

import UIKit

protocol StoryboardInitializable {
    
    static var name: String { get }
    
    static var bundle: Bundle? { get }
}

extension StoryboardInitializable {
    static var bundle: Bundle? {
        return nil
    }
}

protocol IDConvertible {
    
    associatedtype IDIdentity
}

protocol ControllerInitializable: StoryboardInitializable, IDConvertible {
    
    func instantiateInitialViewController() -> UIViewController?
    
    func instantiateViewController(withIdentifier identifier: Self.IDIdentity) -> UIViewController
    
    func instantiateViewController(withIdentifier identifier: String) -> UIViewController
}

extension ControllerInitializable {
    
    func instantiateInitialViewController() -> UIViewController? {
        return UIStoryboard(name: Self.name, bundle: Self.bundle).instantiateInitialViewController()
    }
}

extension ControllerInitializable where IDIdentity: RawRepresentable, IDIdentity.RawValue == String {
    
    func instantiateViewController(withIdentifier identifier: Self.IDIdentity) -> UIViewController {
        return instantiateViewController(withIdentifier: identifier.rawValue)
    }
    
    func instantiateViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: Self.name, bundle: Self.bundle).instantiateViewController(withIdentifier: identifier)
    }
    
}

extension ControllerInitializable where IDIdentity == String {
    
    func instantiateViewController(withIdentifier identifier: Self.IDIdentity) -> UIViewController {
        return UIStoryboard(name: Self.name, bundle: Self.bundle).instantiateViewController(withIdentifier: identifier)
    }
}

protocol StringConvertible {
    var string: String  { get }
}

extension ControllerInitializable where IDIdentity: StringConvertible {
    
    func instantiateViewController(withIdentifier identifier: Self.IDIdentity) -> UIViewController {
        return instantiateViewController(withIdentifier: identifier.string)
    }
    
    func instantiateViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: Self.name, bundle: Self.bundle).instantiateViewController(withIdentifier: identifier)
    }
}



extension UIStoryboard {
    
    static var main: UIStoryboard.Main {
        return Main()
    }
    
    public struct Main: ControllerInitializable {

        typealias IDIdentity = EnumIdentifier
        
        static var name: String { return "Main"}
        
        public enum EnumIdentifier: String {
            case SecondViewController
            case OtherViewController
        }
    }

}

class ViewController: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

