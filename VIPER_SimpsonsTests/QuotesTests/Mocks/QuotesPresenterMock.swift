//
//  QuotesPresenterMock.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 07.12.2021.
//

import Foundation
@testable import VIPER_Simpsons

final class QuotesPresenterMock: PresenterQuotesProtocol {

	var didLoadViewStub: ((() -> Void, @escaping (Result<Void, Error>) -> Void) -> Void)?
	var fetchQuotesStub: ((@escaping (Result<Void, Error>) -> Void) -> Void)?
	var getNumberOfQuotesInSectionStub: (() -> Int)?
	var quoteTextStub: ((IndexPath) -> String)?
	var didSelectRowAtStub: ((Int, @escaping (() -> Void)) -> Void)?
	var deselectRowAtStub: ((Int, @escaping (Int) -> Void) -> Void)?
	var showAlertWithErrorStub: ((() -> Void) -> Void)?
	
	func didLoadView(showHUDCompletion: (() -> Void), wasSuccessFetchQuotes: @escaping (Result<Void, Error>) -> Void) {
		didLoadViewStub?(showHUDCompletion, wasSuccessFetchQuotes)
	}
	
	func fetchQuotes(wasSuccessFetchQuotes: @escaping (Result<Void, Error>) -> Void) {
		fetchQuotesStub?(wasSuccessFetchQuotes)
	}
	
	func getNumberOfQuotesInSection() -> Int {
		getNumberOfQuotesInSectionStub?() ?? 0
	}
	
	func quoteText(indexPath: IndexPath) -> String {
		quoteTextStub?(indexPath) ?? ""
	}
	
	func didSelectRowAt(index: Int, showHUDCompletion: @escaping (() -> Void)) {
		didSelectRowAtStub?(index, showHUDCompletion)
	}
	
	func deselectRowAt(index: Int, deselectCompletion: @escaping (Int) -> Void) {
		deselectRowAtStub?(index, deselectCompletion)
	}

	func showAlertWithError(completion: (() -> Void)) {
		showAlertWithErrorStub?(completion)
	}
}
