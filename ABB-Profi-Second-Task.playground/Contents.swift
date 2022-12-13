import UIKit
//MARK: - Create Memory leak

class Node<T> {
    var value: T
    var next: Node<T>?
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedList<T: Equatable> {
  var head: Node<T>?
  var tail: Node<T>?
  var isEmpty: Bool { head == nil }
  init() {}
    // func append
    mutating func append(value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            self.head = newNode
        }
        self.tail = newNode
    }
    
// write a function to find a value in the list
   mutating func find(value: T) -> Node<T>? {
        var currentNode = head
        while currentNode != nil {
            if currentNode?.value == value {
                return currentNode
            }
            currentNode = currentNode?.next
        }
        return nil
    }
    
// write a function to count the number of elements
    func count() -> Int {
        var count = 0
        var current = head
        while current != nil {
            count += 1
            current = current?.next
        }
        return count
    }
    
    // Function to get/set an element by index (using subscript)
      subscript(index: Int) -> T? {
          get {
              var current = head
              var i = 0
              while current != nil && i < index {
                  i += 1
                  current = current?.next
              }
              return current?.value
          }
          set(newValue) {
              var current = head
              var i = 0
              while current != nil && i < index {
                  i += 1
                  current = current?.next
              }
              current?.value = newValue ?? "" as! T
          }
      }
    
//  write a function to reverse the list
    mutating func reversedList<T>(list: [T]) -> [T] {
        var reversedList: [T] = []
        for element in list.reversed(){
            reversedList.append(element)
        }
        return reversedList
    }
}

var list = LinkedList<Int>()
for i in 1...10 {
    let node = Node(value: i)
    list.append(value: node.value)
    print(list)
}
let listReversed = [1,2,3,4,5]
list.reversedList(list: listReversed)
print(list)
list.find(value: 2)
list[3] = 34
print(list)
list.count()
print("\n")
    //MARK: - code that uses 'weak' where needed to fix the leaks from above
    //MARK: -  code with an escaping closure that strongly captures self which creates a memory leak and which creates no memory leak even though self is strongly captured in the escaping closure
class MyClass {
    var someProperty = "Hello"
    var closure: (() -> Void)?
    func doSomething() {
        closure = { [weak self] in
            guard let self = self else { return }
            print(self.someProperty)
        }
    }
}

let myObject = MyClass()
myObject.doSomething()
// In this case, the closure property is holding a weak reference to `self`,
// which means that `myObject` will be deallocated when we are no longer
// using it. This prevents a memory leak 






