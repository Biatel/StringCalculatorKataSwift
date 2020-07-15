import Foundation

class StringCalculator {
    
    func add(numbers: String) -> Int {
        var numbersToAdd: String = numbers
        var separator: String = ","
        
        guard !numbers.isEmpty else {
            return 0
        }
        
        if numbers.starts(with: "//") {
            let x = numbers.split(separator: "\n", maxSplits: 1, omittingEmptySubsequences: true)
            separator = String((x.first?.dropFirst(2))!)
            numbersToAdd = String(x.last!)
        }
        
        return numbersToAdd
            .replacingOccurrences(of: "\n", with: separator)
            .split(separator: Character(separator))
            .reduce(0) { (accumulation: Int, each: Substring) -> Int in
                return accumulation + toInt(each) }
    }
    
    private func toInt(_ string: Substring) -> Int {
        return Int(string)!
    }
}
