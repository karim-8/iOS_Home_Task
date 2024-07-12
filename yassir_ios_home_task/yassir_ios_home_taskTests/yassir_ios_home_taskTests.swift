//
//  yassir_ios_home_taskTests.swift
//  yassir_ios_home_taskTests
//
//  Created by Karim Soliman on 12/07/2024.
//

import XCTest
@testable import yassir_ios_home_task

class HomeUseCaseTests: XCTestCase {

    var homeUseCase: HomeUseCase!
    var mockRepository: MockHomeRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockHomeRepository(networkClient: NetworkClient())
        homeUseCase = HomeUseCase(repository: mockRepository)
    }

    override func tearDown() {
        mockRepository = nil
        homeUseCase = nil
        super.tearDown()
    }

    func testFetchDataSuccess() {
        mockRepository.shouldSucceed = true

        let expectation = self.expectation(description: "Fetch data successful")
        var charactersDataResult: Result<CharactersDataModel, Error>?
       
        let parameters = "?page=1"
        let fullUrl = request(url: urlEndPoint.baseUrl.rawValue, param: parameters)

        homeUseCase.fetchData(from: fullUrl) { result in
            charactersDataResult = result
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

        switch charactersDataResult {
        case .success(let charactersData):
            XCTAssertNotNil(charactersData)
        case .failure:
            XCTFail("Expected success but got failure")
        case nil:
            XCTFail("Expected result but got nil")
        }
    }

    func testFetchDataFailure() {
        mockRepository.shouldSucceed = false

        let expectation = self.expectation(description: "Fetch data failed")

        let parameters = "?page=9000"
        let fullUrl = request(url: urlEndPoint.baseUrl.rawValue, param: parameters)

        homeUseCase.fetchData(from: fullUrl) { result in
            switch result {
            case .success(let charactersData):
                XCTAssertNil(charactersData.results)
            case .failure(_):
                XCTFail("Expected success but got failure")
            }
        }
        expectation.fulfill()
        waitForExpectations(timeout: 5, handler: nil)
    }
}

