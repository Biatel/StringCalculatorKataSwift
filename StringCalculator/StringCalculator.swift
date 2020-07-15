import Foundation

class StringCalculator {
    static let DEFAULT_DELIMITER = ","
    static let CUSTOM_DELIMITER_PREFIX = "//"
    static let CUSTOM_DELIMITER_POSTFIX = Character("\n")

    func add(numbers: String) -> Int {
        guard !numbers.isEmpty else {
            return 0
        }
        
        let separator = separatorFrom(numbers)

        return numbersToAddFrom(numbers)
            .replacingOccurrences(of: "\n", with: separator)
            .split(separator: Character(separator))
            .reduce(0) { (accumulation: Int, each: Substring) -> Int in
                return accumulation + toInt(each) }
    }

    private func separatorFrom(_ numbers: String) -> String {
        return hasCustomDelimiter(numbers) ? extractSeparatorFrom(numbers) : StringCalculator.DEFAULT_DELIMITER
    }
    
    private func numbersToAddFrom(_ numbers: String) -> String {
        return hasCustomDelimiter(numbers) ? extractNumbersToAddFrom(numbers) : numbers
    }
    
    private func customDelimiterAndNumbersToAddFrom(_ numbers: String) -> [String.SubSequence] {
        return numbers.split(separator: StringCalculator.CUSTOM_DELIMITER_POSTFIX, maxSplits: 1, omittingEmptySubsequences: true)
    }
    
    private func hasCustomDelimiter(_ numbers: String) -> Bool {
        return numbers.starts(with: StringCalculator.CUSTOM_DELIMITER_PREFIX)
    }

    private func extractSeparatorFrom(_ numbers: String) -> String {
        let customDelimiterAndNumbersToAdd = customDelimiterAndNumbersToAddFrom(numbers)
        return String((customDelimiterAndNumbersToAdd.first?.dropFirst(StringCalculator.CUSTOM_DELIMITER_PREFIX.count))!)
    }
    
    private func extractNumbersToAddFrom(_ numbers: String) -> String {
        let customDelimiterAndNumbersToAdd = customDelimiterAndNumbersToAddFrom(numbers)
        return String(customDelimiterAndNumbersToAdd.last!)
    }
    
    private func toInt(_ string: Substring) -> Int {
        return Int(string)!
    }
}
