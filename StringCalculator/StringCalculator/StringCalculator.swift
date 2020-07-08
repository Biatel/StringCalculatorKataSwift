import Foundation

class StringCalculator {
    
    func add(numbers: String) -> Int {
        if numbers.contains(",") {
            let numbersArray = numbers.split(separator: ",")
            return Int(numbersArray[0])! + Int(numbersArray[1])!
        }
        
        return Int(numbers) ?? 0
    }
}
