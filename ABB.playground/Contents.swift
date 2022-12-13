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
