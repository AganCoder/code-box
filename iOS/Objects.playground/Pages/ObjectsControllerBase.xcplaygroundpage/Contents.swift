//: [Previous](@previous)

import UIKit
import Foundation

public typealias ErrorHandler = (Error) -> Void


public protocol ObjectsController {
    
    associatedtype Object
    
    var objects: [Object] { get }
    
    var hasMore: Bool { get }
    
    func clearObjects()
    
    func reload(completion: @escaping ([Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool
    
    func loadMore(completion: @escaping (_ inserted: [Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool
}


// only get
open class AbstractObjectsController<Object>: NSObject, ObjectsController {
    
    open var objects: [Object] { return [] }
    
    open var hasMore: Bool { return false }
    
    open func clearObjects() { }
    
    open func reload(completion: @escaping ([Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool { return false }
    
    open func loadMore(completion: @escaping (_ inserted: [Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool { return false }
}

// get set
open class ObjectsControllerBase<Object>: AbstractObjectsController<Object> {
    
    private var _objects: [Object]

    open override var objects: [Object] {
        get {
            return self._objects
        }
        set {
            self._objects = newValue
        }
    }
    
    private var _hasMore: Bool
    
    open override var hasMore: Bool {
        get {
            return self._hasMore
        }
        set {
            self._hasMore = newValue
        }
    }

    public override init() {
        self._objects = []
        self._hasMore = true
        
        super.init()
    }
    
    open override func clearObjects() {
        self.objects = []
    }
    
    open override func reload(completion: @escaping ([Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool {
        return false
    }
    
    open override func loadMore(completion: @escaping ([Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool {
        return false 
    }
}

open class OffsetObjectsController<Object>: ObjectsControllerBase<Object> {
    
    open var limit: Int
    
    public init(limit: Int = 20) {
        self.limit = limit
        
        super.init()
    }
    
    
    private func loadAndCheckMore(offset: Int, limit: Int, completion: @escaping ([Object], Bool) -> Void, failure: @escaping (ErrorHandler)) -> Bool {
        
        let limit = limit + 1
        
        return self.loadData(offset: offset, limit: limit, completion: { (objects) in
            
            var items = objects
            var hasMore: Bool
            
            if objects.count >= limit {
                hasMore = true
                items.removeSubrange(limit..<items.count)
            } else {
                hasMore = false
            }
            
             completion(items, hasMore)
            
        }, failure: failure)
        
    }
    
    open func loadData(offset: Int, limit: Int, completion: @escaping ([Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool {
        fatalError("Not Implement")
    }
    
    open override func reload(completion: @escaping ([Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool {
        
        return loadAndCheckMore(offset: 0, limit: self.limit, completion: { (objs, hasMore) in
            self.hasMore = hasMore
            self.objects = objs
            completion(self.objects)
            
        }, failure: failure)
    }
    
    open override func loadMore(completion: @escaping ([Object]) -> Void, failure: @escaping (ErrorHandler)) -> Bool {
        
        guard self.hasMore else { return false }
        
        return loadAndCheckMore(offset: 0, limit: self.limit, completion: { (objs, hasMore) in
            self.hasMore = hasMore
            self.objects.append(contentsOf: objs)
            completion(self.objects)
            
        }, failure: failure)


    }
}





//: [Next](@next)
