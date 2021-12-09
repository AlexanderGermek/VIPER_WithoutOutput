//
//  QuotesPresenterTests.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 07.12.2021.
//

import XCTest
@testable import VIPER_Simpsons

final class QuotesViewControllerTests: XCTestCase {

	var presenterMock: QuotesPresenterMock!
	var view: QuotesViewController!

	override func setUp() {
		super.setUp()
		presenterMock = QuotesPresenterMock()
		view = QuotesViewController(presenter: presenterMock)
	}

	override func tearDown() {
		view = nil
		presenterMock = nil
		super.tearDown()
	}

	func testDidLoadView() {
		//arrange
		var isDidLoadViewCalled = false
		presenterMock.didLoadViewStub = { _, _ in
			isDidLoadViewCalled = true
		}

		//act
		view.viewDidLoad()

		//assert
		XCTAssert(isDidLoadViewCalled)
	}

	func testRefreshControlAction() {
		//arrange
		var isRefreshControlActionCalled = false
		presenterMock.fetchQuotesStub = { _ in
			isRefreshControlActionCalled = true
		}

		//act
		view.refreshControlAction()

		//assert
		XCTAssert(isRefreshControlActionCalled)
	}

	func testNumberOfRowsInSection() {
		//arrange
//		var isNumberOfRowsInSectionCalled = false
//		presenterMock.getNumberOfQuotesInSectionStub = { closure in
//			isNumberOfRowsInSectionCalled = true
//			return closure
//		}

		//act
		//view.tableView(UITableView(), numberOfRowsInSection: 3)

		//assert
		//XCTAssert(isNumberOfRowsInSectionCalled)

	}

	func testQuoteText() {
		//arrange
		var isQuoteTextCalled = false
		let indexPath = IndexPath(row: 1, section: 0)
		presenterMock.quoteTextStub = { indexPathFromStub in
			isQuoteTextCalled = indexPath == indexPathFromStub
			return ""
		}

		//act
		let _ = view.tableView(UITableView(), cellForRowAt: indexPath)

		//assert
		XCTAssert(isQuoteTextCalled)
	}

	func testDidSelectDeselectRowAt() {
		//arrange
		var isDidSelectRowAtCalled = false
		var isDeselectRowAtCalled = false
		let indexPath = IndexPath(row: 1, section: 0)
		presenterMock.deselectRowAtStub = { indexFromStub, _ in
			isDeselectRowAtCalled = indexPath.row == indexFromStub
		}
		presenterMock.didSelectRowAtStub = { indexFromStub, _ in
			isDidSelectRowAtCalled = indexPath.row == indexFromStub
		}

		//act
		view.tableView(UITableView(), didSelectRowAt: indexPath)


		//assert
		XCTAssert(isDeselectRowAtCalled)
		XCTAssert(isDidSelectRowAtCalled)
	}
}
