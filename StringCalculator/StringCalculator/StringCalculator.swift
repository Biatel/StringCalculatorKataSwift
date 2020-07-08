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
            return numbers
                .split(separator: ",")
                .reduce(0) { (accumulation: Int, each: Substring) -> Int in
                    return accumulation + toInt(each)
            }
        }
        
        return toInt(numbers)
    }
}
