//
//  QuotesDetailInteractorTests.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 09.12.2021.
//

import XCTest
@testable import VIPER_Simpsons

final class QuotesDetailInteractorTests: XCTestCase {

	override func setUp() {
		super.setUp()
	}

	override func tearDown() {
		super.tearDown()
	}

	func testGetQuoteData() {
		//arrange
		let quote = Quote(quote: "quote", character: "character", image: "https://via.placeholder.com/600/24f355")
		let serviceLocatorMock = ServiceLocatorMock()
		let imageDataServiceMock = ImageDataServiceMock()
		serviceLocatorMock.imageDataServiceMock = imageDataServiceMock
		let interactor = QuoteDetailInteractor(quote: quote, serviceLocator: serviceLocatorMock)
		var isGetQuoteData = false
		serviceLocatorMock.imageDataServiceMock?.downloadImageStub = { _, _ in
			isGetQuoteData = true
		}

		//act
		interactor.getQuoteData { (_) in }

		//assert
		XCTAssertTrue(isGetQuoteData)
	}

}
