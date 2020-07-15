import Foundation

class StringCalculator {
    
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

    private func toInt(_ string: Substring) -> Int {
        return Int(string)!
    }
}
