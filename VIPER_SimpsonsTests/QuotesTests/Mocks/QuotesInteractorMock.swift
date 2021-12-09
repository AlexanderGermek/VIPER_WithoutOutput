//
//  QuotesInteractorMock.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 07.12.2021.
//

import Foundation
@testable import VIPER_Simpsons

final class QuotesInteractorMock: InteractorQuotesProtocol {
	var getQuoteTextStub: ((IndexPath, @escaping (String) -> Void) -> Void)?
	var loadQuotesStub: ((@escaping (Result<Void, Error>) -> Void) -> Void)?
	var checkQuoteStub: ((Int, @escaping (Quote?) -> Void) -> Void)?
	var quotesInSectionStub: ((@escaping (Int?) -> Void) -> Void)?

	func getQuoteText(for indexPath: IndexPath, quoteTextCompletion: @escaping ((String) -> Void)) {
		getQuoteTextStub?(indexPath, quoteTextCompletion)
	}

	func loadQuotes(wasSuccessFetchQuotes: @escaping (Result<Void, Error>) -> Void) {
		loadQuotesStub?(wasSuccessFetchQuotes)
	}

	func checkQuote(at index: Int, completion: @escaping (Quote?) -> Void) {
		checkQuoteStub?(index, completion)
	}

	func quotesInSection(quotesNumberCompletion: @escaping (Int?) -> Void) {
		quotesInSectionStub?(quotesNumberCompletion)
	}
}
