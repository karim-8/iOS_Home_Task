//
//  yassir_ios_home_taskUITests.swift
//  yassir_ios_home_taskUITests
//
//  Created by Karim Soliman on 12/07/2024.
//

import XCTest

final class yassir_ios_home_taskUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {

        
        let app = XCUIApplication()
        app.launch()

        // Wait for the timeout
       // waitForExpectations(timeout: 5, handler: nil)

        let tablesQuery = app.tables
        tablesQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 0).tap()
        app.buttons["arrow.backward"].tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Dead"]/*[[".cells.staticTexts[\"Dead\"]",".staticTexts[\"Dead\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["unknown"]/*[[".cells.staticTexts[\"unknown\"]",".staticTexts[\"unknown\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery.cells.otherElements.containing(.staticText, identifier:"Alive").element.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Reset"]/*[[".cells.staticTexts[\"Reset\"]",".staticTexts[\"Reset\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.swipeUp()

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
