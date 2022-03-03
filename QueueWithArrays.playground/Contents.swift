import UIKit

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public class QueueArray<T>: Queue {
    private var array: [T] = []
    public init() {}
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var peek: T? {
        return array.first
    }
    
    public func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    
    public var description: String {
        array.description
    }
}

let peopleInQueue = QueueArray<Int>()
peopleInQueue.enqueue(9)
peopleInQueue.enqueue(19)
peopleInQueue.enqueue(39)
peopleInQueue.enqueue(89)

if let person = peopleInQueue.dequeue() {
    print(person)
}
