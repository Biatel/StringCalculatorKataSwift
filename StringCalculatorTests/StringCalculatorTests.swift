import XCTest
@testable import StringCalculator

class StringCalculatorTests: XCTestCase {
    
    var stringCalculator: StringCalculator!
    
    override func setUp() {
        stringCalculator = StringCalculator()
    }
    
    func testAddEmptyStringReturnsZero() {
        XCTAssertEqual(0, stringCalculator.add(numbers: ""))
    }
    
    func testAddOneNumberReturnsThatNumber() {
        XCTAssertEqual(1, stringCalculator.add(numbers: "1"))
    }
    
    func testAddAllowAnyAmountOfNumbersToSum() {
        XCTAssertEqual(6, stringCalculator.add(numbers: "1,2,3"))
    }
    
    func testAddAllowNewLinesAsNumberSeparator() {
        XCTAssertEqual(6, stringCalculator.add(numbers: "1\n2,3"))
    }
    
    func testAddWithCustomDelimiter() {
        XCTAssertEqual(3, stringCalculator.add(numbers: "//;\n1;2"))
    }
    
    func testAddWithCustomDelimiterMultipleNumbersToSum() {
        XCTAssertEqual(6, stringCalculator.add(numbers: "//;\n1;2;3"))
    }
}
