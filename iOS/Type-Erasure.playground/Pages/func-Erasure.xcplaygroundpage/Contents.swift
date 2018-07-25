//: [Previous](@previous)

import Foundation

struct MAnySequence<Element>: Sequence {
    struct Iterator: IteratorProtocol {
        let _next: () -> Element?
        
        func next() -> Element? {
            return _next()
        }
    }
    
    let _makeIterator: () -> Iterator
    
    func makeIterator() -> Iterator {
        return _makeIterator()
    }
    
    init<Seq: Sequence>(_ seq: Seq) where Seq.Element == Element {
        _makeIterator = {
            var iterator = seq.makeIterator()
        }
    }
    
}

//: [Next](@next)
