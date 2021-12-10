//
//  QuotesInteratorTests.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 09.12.2021.
//

import XCTest
@testable import VIPER_Simpsons

final class QuotesInteractorTests: XCTestCase {

	override func setUp() {
		super.setUp()
	}

	override func tearDown() {
		super.tearDown()
	}

	func testLoadQuotes() {
		//arrange
		let serviceLocator = ServiceLocatorMock()
		let apiCallerMock = APICallerMock()
		serviceLocator.apiCallerMock = apiCallerMock
		let interactor = QuotesInteractor(serviceLocator: serviceLocator)

		var isCheckQuoteCalled = false
		serviceLocator.apiCallerMock?.getSimpsonQuotesStub = { _, _ in
			isCheckQuoteCalled = true
		}

		//act
		interactor.loadQuotes { (_) in }

		//assert
		XCTAssertTrue(isCheckQuoteCalled)
	}
}
