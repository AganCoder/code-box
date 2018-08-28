import UIKit
import Foundation

public typealias ErrorHandler = (Error) -> Void


public protocol ObjectsController {
    
    associatedtype Object
    
    var objects: [Object] { get }
    
    var hasMore: Bool { get }
    
    func clearObjects()
    
    func reload(copletion: @escaping ([Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool
    
    func loadMore(completion: @escaping (_ inserted: [Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool
}

// error: only classes and overridable class members can be declared 'open'; use 'public'
// warning: declaring open var in public extension
//public extension ObjectsController where Self: NSObject {
//
//    open var objects: [Object] {
//        return []
//    }
//
//    open var hasMore: Bool {
//        return true
//    }
//
//    open func clearObjects() { }
//
//    open func reload(completing: @escaping ([Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool { return false }
//
//    open func loadMore(completion: @escaping (_ inserted: [Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool { return false }
//}


open class AbstractObjectsController<Object>: ObjectsController {
    
    open var objects: [Object] { return [] }

    open var hasMore: Bool { return false }

    open func clearObjects() { }

    open func reload(copletion: @escaping ([Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool { return false }

    open func loadMore(completion: @escaping (_ inserted: [Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool { return false }
}

