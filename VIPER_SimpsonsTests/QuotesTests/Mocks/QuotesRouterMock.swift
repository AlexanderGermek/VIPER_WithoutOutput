//
//  QuotesRouterMock.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 07.12.2021.
//

import Foundation
@testable import VIPER_Simpsons

final class QuotesRouterMock: RouterQuotesProtocol {
	var openQuoteDetailControllerStub: ((Quote) -> Void)?
	
	func openQuoteDetailController(with quote: Quote) {
		openQuoteDetailControllerStub?(quote)
	}
}
