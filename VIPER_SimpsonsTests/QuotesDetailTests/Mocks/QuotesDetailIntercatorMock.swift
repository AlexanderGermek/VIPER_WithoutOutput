//
//  QuotesDetailIntercatorMock.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 09.12.2021.
//

import Foundation
@testable import VIPER_Simpsons

final class QuotesDetailInteractorMock: InteractorQuoteDetailProtocol {
	var quote: Quote?

	var getQuoteDataStub: ((@escaping (QuoteDetailViewModel) -> Void) -> Void)?

	func getQuoteData(completion: @escaping ((QuoteDetailViewModel) -> Void)) {
		getQuoteDataStub?(completion)
	}
}
