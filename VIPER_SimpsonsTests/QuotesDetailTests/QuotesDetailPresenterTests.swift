//
//  QuotesDetailPresenterTests.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 09.12.2021.
//

import XCTest
@testable import VIPER_Simpsons

final class QuotesDetailPresenterTests: XCTestCase {
	var interactorMock: QuotesDetailInteractorMock!
	var routerMock: QuotesDetailRouterMock!
	var presenter: QuoteDetailPresenter!

	override func setUp() {
		super.setUp()
		interactorMock = QuotesDetailInteractorMock()
		routerMock = QuotesDetailRouterMock()
		presenter = QuoteDetailPresenter(interactor: interactorMock, router: routerMock)
	}

	override func tearDown() {
		interactorMock = nil
		routerMock = nil
		presenter = nil
		super.tearDown()
	}

	func testDidLoadView() {
		//arrange
		var isDidLoadViewCalled = false
		interactorMock.getQuoteDataStub = { _ in
			isDidLoadViewCalled = true
		}

		//act
		presenter.didLoadView { (_) in }

		//assert
		XCTAssertTrue(isDidLoadViewCalled)
	}
}
