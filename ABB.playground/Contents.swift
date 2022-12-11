import Foundation

 //MARK: - Create a function that would return digits of a given number
func digits(n: Int) -> [Int]{
    var number = n
    var digits: [Int] = []
    while number > 0 {
        digits.insert(number % 10, at: 0)
        number /= 10
    }
    while number < 0 {
        digits.insert(number % 10, at: 0)
        number /= 10
    }
  
    return digits
}
print(digits(n: 123))
print(digits(n: -1024))

extension Collection {
    func enumeratedMap<T>(_ transform: (Int,Element) -> T) -> [T] {
        var counter = -1
        return map {
          counter += 1
            return transform(counter, $0)
        }
      }
}
[1,2,3].enumeratedMap { r, m in
    if r == 1 {
        print(m * 2)
    }
}
////MARK: - Ccreate enumeratedMap function as collection extension
//extension Sequence {
//    func myMap<T>( _ transform: (Self.Element) throws -> T) rethrows -> [T] {
//        var array: [T] = []
//        for element in self {
//            do {
//                try array.append(transform(element))
//            } catch (let error) {
//                print(error.localizedDescription)
//            }
//        }
//        return array
//    }
//
//    func myForEach(_ body: (Self.Element) throws -> Void) {
//        for element in self {
//            do {
//                try body(element)
//            } catch (let error) {
//                print(error.localizedDescription)
//            }
//        }
//    }
//
//    func myEnumerated() -> MyEnumeratedSequence<Self> {
//        let enumerated = MyEnumeratedSequence<Self>(self)
//        return enumerated
//    }
//
//    var myisEmpty: Bool {
//        self.underestimatedCount == 0 ? false : true
//    }
//}
//
//struct MyEnumeratedSequence<Base> where Base: Sequence {
//    var base: Base
//
//    init(_ base: Base) {
//        self.base = base
//    }
//}
//
//extension MyEnumeratedSequence {
//    struct Iterator {
//        var base: Base.Iterator
//        var count: Int
//
//        init(_ base: Base.Iterator) {
//            self.base = base
//            self.count = 0
//        }
//    }
//}
//
//extension MyEnumeratedSequence.Iterator: IteratorProtocol, Sequence {
//    typealias Element = (offset: Int, element: Base.Element)
//    mutating func next() -> Element? {
//        guard let b = base.next() else { return nil }
//        let result = (offset: count, element: b)
//        count += 1
//        return result
//    }
//}
//
//extension MyEnumeratedSequence: Sequence {
//    func makeIterator() -> Iterator {
//        return Iterator(base.makeIterator())
//    }
//}
//[1,4,3].myEnumerated().myMap { m, n in
//    if m == 2 {
//        print(n * 2)
//    }
//}
//print("\n")
//["1","4","3"].myEnumerated().myMap { m, n in
//    if m == 2 {
//        print(n.reversed())
//    }
//}
//print()
//
//[1,2,3,5].myForEach { r in
//    print(r * 4)
//}
//print("\n")
//[1,2,3,4].myMap { m in
//    print(m.byteSwapped)
//}
//
//
//
