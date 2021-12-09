//
//  QuotesInteratorTests.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 09.12.2021.
//

import XCTest
@testable import VIPER_Simpsons

final class QuotesInteractorTests: XCTestCase {
	var interactor: QuotesInteractor!
	var serviceLocator: ServiceLocatorMock!

	override func setUp() {
		super.setUp()
		serviceLocator = ServiceLocatorMock()
		interactor = QuotesInteractor(serviceLocator: serviceLocator)
	}

	override func tearDown() {
		interactor = nil
		serviceLocator = nil
		super.tearDown()
	}

	func testT() {
		//let quotes: [Quote] = [.init(quote: "quote", character: "character", image: "image"),
			//				   .init(quote: "quote2", character: "character2", image: "image2")]

//		var testQuotes: [Quote] = []
//		var testError: Error?

//		serviceLocator.apiCaller.getSimpsonQuotes(count: 10) { (result) in
//			switch result {
//			case .success(let quotes):
//				testQuotes = quotes
//			case .failure(let error):
//				testError = error
//			}
//		}

		let index = 1
		interactor.checkQuote(at: index) { (quote) in

		}
	}


}
