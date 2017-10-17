import XCTest

class SomeTest: XCTestCase {
    func testOk() {
        print("ok")
    }
    func testFail() {
        print("fail")
        XCTAssertEqual(1, 0, "broken.")
    }
}

class SomeTest2: XCTestCase {
    func testOk2() {}
}

class Listener: NSObject, XCTestObservation {
    func testSuiteWillStart(_ testSuite: XCTestSuite) {
        print ("START TEST SUITE: " + testSuite.name!)
    }
    func testSuiteDidFinish(_ testSuite: XCTestSuite) {
        print ("END TEST SUITE: " + testSuite.name!)
    }
    func testCaseWillStart(_ testCase: XCTestCase) {
        print("START TEST CASE: " + testCase.name!)
    }
    func testCase(_ testCase: XCTestCase, 
                didFailWithDescription description: String, 
                inFile filePath: String?, 
                atLine lineNumber: UInt) {
        print("FAILURE: [" + description + "]")
    }
    func testCaseDidFinish(_ testCase: XCTestCase) {
        print("END TEST CASE: " + testCase.name!)
    }
}

let l = Listener()

XCTestObservationCenter.shared().addTestObserver(l)

let s = XCTestSuite.default()
s.run()
