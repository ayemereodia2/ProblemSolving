import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
//class Solution {
//
//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//        var headNode:ListNode? = ListNode(0)
//        var templist1 = list1
//        var templist2 = list2
//        var tempHead:ListNode?
//
//        repeat {
//            if let val1 = templist1?.val, let val2 = templist2?.val {
//
//                if val1 < val2 {
//                    if headNode?.next == nil {
//                        headNode?.next = list1
//                    }else{
//                        tempHead = headNode?.next
//                        tempHead = list1
//                    }
//                    templist1 = templist1?.next
//                }else if val2 < val1 {
//                    if headNode?.next == nil {
//                        headNode?.next = list1
//                    }else{
//                        tempHead = headNode?.next
//                        tempHead = list2
//                    }
//                    templist2 = templist2?.next
//                }else {
//                    if headNode?.next == nil {
//                        headNode?.next = list1
//                        headNode?.next?.next = list2
//                    }else{
//                        tempHead = headNode?.next
//                        tempHead = list2
//                        tempHead?.next = list1
//                    }
//                }
//            }
//
//
//        }while (templist1?.next != nil && templist2?.next != nil)
//        headNode = tempHead
//
//        return headNode
//    }
//}
let l1 = ListNode(1,l2)
let l2 = ListNode(2,l3)
let l3 = ListNode(3,l4)
let l4 = ListNode(4,nil)

var head = ListNode(0, l1)
//
//let l5 = ListNode(5,l6)
//let l6 = ListNode(6,l7)
//let l7 = ListNode(7,l8)
//let l8 = ListNode(8,nil)
//
//let head2 = ListNode(0, l5)
//
//let sol = Solution()
//let result = sol.mergeTwoLists(head,head2)

//What is a LinkedList DS?

public class LinkListNode<T> {
    public var data: T
    public var next: LinkListNode?
    weak var prev: LinkListNode?
    
    init(data: T) {
        self.data = data
    }
}


public class LinkList<T> {
    public typealias Node = LinkListNode<T>
    
    private var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        guard var last = head else { return nil }
        
        while let next = last.next {
            last = next
        }
        return last
    }
    
    public func append(data: T) {
        let newData = Node(data: data)
        
        if let lastNode = last {
            lastNode.next = newData
            newData.prev = lastNode
        }else {
            head = newData
        }
    }
    
    public var count: Int {
        guard var head = head else { return 0 }
        
        var count = 0
        count += 1
        while let next = head.next {
            count += 1
            head = next
        }
        return count
    }
}


let n1 = LinkList<String>()
n1.append(data: "Hello")
n1.append(data: "Hello")


print(n1.count)

