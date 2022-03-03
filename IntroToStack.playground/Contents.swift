import UIKit

public struct Stack<Element> {
    private var storage:[Element] = []
    
    public init(_ element:[Element]) {
        storage = element
    }
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        let topDivider = "-----top----\n"
        let bottomDivider = "\n----------"
       let stackElement = storage
            .map {"\($0)"}
            .reversed()
            .joined(separator: "\n")
        return topDivider + stackElement + bottomDivider
    }
}

extension Stack {
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
}
extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
