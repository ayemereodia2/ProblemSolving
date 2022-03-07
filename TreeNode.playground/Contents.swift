import UIKit

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element)
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
    
    public func enqueue(_ element: T) {
        array.append(element)
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

class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
    
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        let queue = QueueArray<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

extension TreeNode where T: Equatable {
     func search(_ value: T) -> TreeNode? {
         var result: TreeNode?
         forEachLevelOrder { node in
             if node.value == value {
                 result = node
             }
         }
         return result
    }
}
//let beverages = TreeNode<String>("Beverage")
//let coffee = TreeNode<String>("Coffee")
//let tea = TreeNode<String>("Tea")
//beverages.add(coffee)
//beverages.add(tea)

func makeBeverageTree() -> TreeNode<String> {
  let tree = TreeNode("Beverages")
  let hot = TreeNode("hot")
  let cold = TreeNode("cold")
  let tea = TreeNode("tea")
  let coffee = TreeNode("coffee")
  let chocolate = TreeNode("cocoa")
  let blackTea = TreeNode("black")
  let greenTea = TreeNode("green")
  let chaiTea = TreeNode("chai")
  let soda = TreeNode("soda")
  let milk = TreeNode("milk")
  let gingerAle = TreeNode("ginger ale")
  let bitterLemon = TreeNode("bitter lemon")
  tree.add(hot)
  tree.add(cold)
    
  hot.add(tea)
  hot.add(coffee)
  hot.add(chocolate)
    
  cold.add(soda)
  cold.add(milk)
    
  tea.add(blackTea)
  tea.add(greenTea)
  tea.add(chaiTea)
    
  soda.add(gingerAle)
  soda.add(bitterLemon)
    
  return tree
}

let tree = makeBeverageTree()

tree.forEachLevelOrder {
    print($0.value)
}
