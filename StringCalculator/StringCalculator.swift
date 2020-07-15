import Foundation

class StringCalculator {
    
    func add(numbers: String) -> Int {
        var numbersToAdd: String
        var separator: String
        
        guard !numbers.isEmpty else {
            return 0
        }
        
        if hasCustomDelimiter(numbers) {
            separator = extractSeparatorFrom(numbers)
            numbersToAdd = extractNumbersToAddFrom(numbers)
        } else {
            numbersToAdd = numbers
            separator = ","
        }
        
        return numbersToAdd
            .replacingOccurrences(of: "\n", with: separator)
            .split(separator: Character(separator))
            .reduce(0) { (accumulation: Int, each: Substring) -> Int in
                return accumulation + toInt(each) }
    }

    private func customDelimiterAndNumbersToAddFrom(_ numbers: String) -> [String.SubSequence] {
        return numbers.split(separator: "\n", maxSplits: 1, omittingEmptySubsequences: true)
    }
    
    private func hasCustomDelimiter(_ numbers: String) -> Bool {
        return numbers.starts(with: "//")
    }

    private func extractSeparatorFrom(_ numbers: String) -> String {
        let customDelimiterAndNumbersToAdd = customDelimiterAndNumbersToAddFrom(numbers)
        return String((customDelimiterAndNumbersToAdd.first?.dropFirst(2))!)
    }
    
    private func extractNumbersToAddFrom(_ numbers: String) -> String {
        let customDelimiterAndNumbersToAdd = customDelimiterAndNumbersToAddFrom(numbers)
        return String(customDelimiterAndNumbersToAdd.last!)
    }
    
    private func toInt(_ string: Substring) -> Int {
        return Int(string)!
    }
}
