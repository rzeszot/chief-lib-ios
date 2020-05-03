import XCTest
@testable import Chief

final class ChiefTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Chief().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
