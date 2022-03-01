
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        // (1)loop through the linked list
        // (2) keep an array containing unique numbers
        // (3) form a new linked-list by running a loop through the unique array from (2)
        // (4) return head of new linked-list
        var uniqueArray: [Int] = []
        var tempHead = head
        while(tempHead?.next != nil) {
            if let value = tempHead?.val {
                 if !uniqueArray.contains(value) {
                  uniqueArray.append(value)
            }
          }
            tempHead = tempHead?.next
        }
               
        if let lastValue = tempHead?.val {
             if !uniqueArray.contains(lastValue) {
              uniqueArray.append(lastValue)
            }
        }
        
        var resultHead: ListNode?
        
        for i in uniqueArray {
            let newNode = ListNode(i)
            if var temp = resultHead {
                while let next = temp.next {
                    temp = next
                }
                temp.next = newNode

            }else {
                resultHead = newNode
            }
        }
        
        return resultHead
    }
}
