import Foundation

class StringCalculator {
    
    private func toInt(_ string: String) -> Int {
        return Int(string) ?? 0
    }
    
    func add(numbers: String) -> Int {
        if numbers.contains(",") {
            let numbersArray = numbers.split(separator: ",")
            return toInt(String(numbersArray[0])) + toInt(String(numbersArray[1]))
        }
        
        return toInt(numbers)
    }
}
