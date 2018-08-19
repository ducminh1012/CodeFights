import UIKit

// Definition for singly-linked list:
 public class ListNode<T> {
     public var value: T
     public var next: ListNode<T>?
     public init(_ x: T) {
         self.value = x
         self.next = nil
     }
 }

func removeKFromList(l: ListNode<Int>?, k: Int) -> ListNode<Int>? {
    let node = ListNode<Int>(0)
    node.next = l
    
    var p = node
    
    while let next = p.next {
        if (p.next?.value == k) {
            p.next = next.next
        } else {
            p = next
        }
        
    }
    
    return node.next
}

var node1 = ListNode<Int>(3)
var node2 = ListNode<Int>(1)
var node3 = ListNode<Int>(2)
var node4 = ListNode<Int>(3)
var node5 = ListNode<Int>(4)
var node6 = ListNode<Int>(5)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6

let r = removeKFromList(l: node1, k: 3)
r?.value
