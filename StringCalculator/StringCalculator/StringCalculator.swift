import Foundation

class StringCalculator {
    
    func add(numbers: String) -> Int {
        if numbers.isEmpty {
            return 0
        }
        return Int(numbers)!
    }
}
