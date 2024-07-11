//
//  Yassir_Task_UITests.swift
//  Yassir_Task_UITests
//
//  Created by Karim Soliman on 11/07/2024.
//

import XCTest
@testable import Yassir_Task

final class Yassir_Task_UITests: XCTestCase {

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
        let _ = XCTWaiter.wait(for: [XCTestExpectation(description: "")], timeout: 2.0)

        app.navigationBars["Characters"].staticTexts["Characters"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 0).tap()
        app.buttons["arrow.backward"].tap()
        
        let collectionViewsQuery = app.collectionViews
        let cellsQuery = collectionViewsQuery.cells
        cellsQuery.otherElements.containing(.staticText, identifier:"Alive").element.tap()
        cellsQuery.otherElements.containing(.staticText, identifier:"unknown").element.tap()
        cellsQuery.otherElements.containing(.staticText, identifier:"Dead").element.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Reset"]/*[[".cells.staticTexts[\"Reset\"]",".staticTexts[\"Reset\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.children(matching: .cell).element(boundBy: 4).children(matching: .other).element(boundBy: 0).swipeUp()
        tablesQuery.children(matching: .cell).element(boundBy: 10).children(matching: .other).element(boundBy: 0).swipeUp()
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
