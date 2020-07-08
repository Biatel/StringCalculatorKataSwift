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
    
    func testAddTwoNumberReturnsTheirSum() {
        XCTAssertEqual(3, stringCalculator.add(numbers: "1,2"))
    }
}
