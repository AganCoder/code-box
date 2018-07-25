import UIKit

class MAnySequence<Element>: Sequence {
    
    class Iterator: IteratorProtocol {
        func next() -> Element? {
            fatalError("Must Override next()")
        }
    }
    
    func makeIterator() -> Iterator {
        fatalError("Must override makeIterator()")
    }
}

extension MAnySequence {
    static func make<Seq: Sequence>(_ seq: Seq) -> MAnySequence<Element> where Seq.Element == Element {
        return MAnySequenceImpl<Seq>(seq)
    }
}


private class MAnySequenceImpl<Seq: Sequence>: MAnySequence<Seq.Element> {
    
    class IteratorImpl: Iterator {
        
        var wrapped: Seq.Iterator
        
        init(_ wrapped: Seq.Iterator) {
            self.wrapped = wrapped
        }
        
        override func next() -> Seq.Element? {
            return wrapped.next()
        }
    }
    
    var seq: Seq
    
    init(_ seq: Seq) {
        self.seq = seq
    }
    
    override func makeIterator() -> MAnySequence<Seq.Element>.Iterator {
        return IteratorImpl(seq.makeIterator())
    }
}


func printInts(_ seq: MAnySequence<Int>) {
    for elt in seq {
        print(elt)
    }
}

let array = [1, 2, 3, 4, 5]
printInts(MAnySequence.make(array))
printInts(MAnySequence.make(array[1 ..< 4]))


