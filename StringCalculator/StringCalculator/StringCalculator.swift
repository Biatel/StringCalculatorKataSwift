import Foundation

class StringCalculator {
    
    private func toInt(_ string: Substring) -> Int {
        return Int(string)!
    }
    
    func add(numbers: String) -> Int {
        guard !numbers.isEmpty else {
            return 0
        }
        
        return numbers
            .replacingOccurrences(of: "\n", with: ",")
            .split(separator: ",")
            .reduce(0) { (accumulation: Int, each: Substring) -> Int in
                return accumulation + toInt(each)
        }
        
    }
}
