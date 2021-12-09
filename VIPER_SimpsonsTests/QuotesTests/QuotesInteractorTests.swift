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
		interactor = QuotesInteractor()
		serviceLocator = ServiceLocatorMock()
	}

	override func tearDown() {
		interactor = nil
		serviceLocator = nil
		super.tearDown()
	}

	func testT() {
		let quotes: [Quote] = [.init(quote: "quote", character: "character", image: "image"),
							   .init(quote: "quote2", character: "character2", image: "image2")]

		let index = 1
		interactor.checkQuote(at: index) { (quote) in

		}
	}


}
