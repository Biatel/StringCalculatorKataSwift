import Foundation

class StringCalculator {
    
    private func toInt(_ string: String) -> Int {
        return Int(string) ?? 0
    }

    private func toInt(_ string: Substring) -> Int {
        return Int(string) ?? 0
    }
    
    func add(numbers: String) -> Int {
        if numbers.contains(",") {
            let numbersArray = numbers.split(separator: ",")
            return toInt(numbersArray[0]) + toInt(numbersArray[1])
        }
        
        return toInt(numbers)
    }
}
