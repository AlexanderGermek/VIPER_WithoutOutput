//
//  QuotesPresenterTests.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 07.12.2021.
//

import XCTest
@testable import VIPER_Simpsons

final class QuotesPresenterTests: XCTestCase {
	var interactorMock: QuotesInteractorMock!
	var routerMock: QuotesRouterMock!
	var presenter: QuotesPresenter!

	override func setUp() {
		super.setUp()
		interactorMock = QuotesInteractorMock()
		routerMock = QuotesRouterMock()
		presenter = QuotesPresenter(interactor: interactorMock, router: routerMock)
	}

	override func tearDown() {
		interactorMock = nil
		routerMock = nil
		presenter = nil
		super.tearDown()
	}

	func testDidLoadViewAndrefreshControlAction() {
		//arrange
		var isLoadQuotesCalled = false
		interactorMock.loadQuotesStub = { _ in
			isLoadQuotesCalled = true
		}

		//act
		presenter.didLoadView {

		} wasSuccessFetchQuotes: { _ in

		}

		//assert
		XCTAssert(isLoadQuotesCalled)
	}

	func testGetNumberOfQuotesInSection() {
		//arrange
		var isGetNumberOfQuotesInSectionCalled = false
		interactorMock.quotesInSectionStub = { _ in
			isGetNumberOfQuotesInSectionCalled = true
		}

		//act
		let _ = presenter.getNumberOfQuotesInSection()

		//assert
		XCTAssert(isGetNumberOfQuotesInSectionCalled)
	}

	func testQuoteText() {
		//arrange
		var isQuoteTextCalled = false
		let testIndexPath = IndexPath(row: 1, section: 0)
		interactorMock.getQuoteTextStub = { indexPath, _ in
			isQuoteTextCalled = testIndexPath == indexPath
		}

		//act
		let _ = presenter.quoteText(indexPath: testIndexPath)

		//assert
		XCTAssert(isQuoteTextCalled)
	}

	func testDidSelectRowAt() {
		//arrange
		var isDidSelectRowAtCalled = false
		let testIndex = 5
		interactorMock.checkQuoteStub = { index, _ in
			isDidSelectRowAtCalled = testIndex == index
		}

		//act
		presenter.didSelectRowAt(index: testIndex) { }

		//assert
		XCTAssert(isDidSelectRowAtCalled)
	}
}
