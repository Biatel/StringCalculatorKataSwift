import Foundation

class StringCalculator {
    
    func add(numbers: String) -> Int {
        guard !numbers.isEmpty else {
            return 0
        }
        
        if numbers.starts(with: "//") {
            let x = numbers.split(separator: "\n", maxSplits: 1, omittingEmptySubsequences: true)
            let separator = String((x.first?.dropFirst(2))!)
            let numbersToAdd = String(x.last!)
            return numbersToAdd.split(separator: Character(separator))
                .reduce(0) { (accumulation: Int, each: Substring) -> Int in
                    return accumulation + toInt(each) }
        }
        
        return numbers
            .replacingOccurrences(of: "\n", with: ",")
            .split(separator: ",")
            .reduce(0) { (accumulation: Int, each: Substring) -> Int in
                return accumulation + toInt(each) }
    }
    
    private func toInt(_ string: Substring) -> Int {
        return Int(string)!
    }
}
