import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    
    var headNode:ListNode? = nil

    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var templist1 = list1
        var templist2 = list2
        
        if list1 == nil && list2 == nil {
            return nil
        }
        
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        
        repeat {
            let val1 = templist1?.val ?? 0
            let val2 = templist2?.val ?? 0
            if templist1 != nil && templist2 != nil {
            
            if  val1 < val2 {
                addToHead(data: val1)
                templist1 = templist1?.next

            } else {
                addToHead(data: val2)
                templist2 = templist2?.next
            }
        }
             
         if templist1 != nil && templist2 == nil {
             let val1 = templist1?.val ?? 0
            addToHead(data: val1)
            templist1 = templist1?.next
        }
            
        if templist2 != nil && templist1 == nil {
             let val2 = templist2?.val ?? 0
            addToHead(data: val2)
         templist2 = templist2?.next
 
        }
        
     }
        while (templist1 != nil || templist2 != nil)
        return headNode
    }
    
       private func addToHead(data: Int) {
           if data == 7 {
               print(data)
           }
        let newNode = ListNode(data)
        var head = headNode
        if var temp = head {
            
            while let next = temp.next {
                
                temp = next
            }
            temp.next = newNode
          
        }else {
            head = newNode
            headNode = head
        }
    }
}


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

var headNode: ListNode?
private func addToHead(data: Int) {
    let newNode = ListNode(data)
    var head = headNode
    if var temp = head {
        
        while let next = temp.next {
            temp = next
        }
        temp.next = newNode
    }else {
        head = newNode
        headNode = head
    }
}

addToHead(data: 3)
addToHead(data: 5)
addToHead(data: 7)

print(headNode?.next?.next?.val)
