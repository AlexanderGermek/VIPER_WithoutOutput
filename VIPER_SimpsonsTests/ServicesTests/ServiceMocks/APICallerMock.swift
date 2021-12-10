//
//  APICallerMock.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 09.12.2021.
//

import UIKit
@testable import VIPER_Simpsons

final class APICallerMock: APICallerMockProtocol {
	var urlSession: URLSession!

	var getSimpsonQuotesStub: ((Int, @escaping (Result<[Quote], Error>) -> Void) -> Void)?

	func getSimpsonQuotes(count: Int, completion: @escaping (Result<[Quote], Error>) -> Void) {
		getSimpsonQuotesStub?(count,completion)
	}
}
