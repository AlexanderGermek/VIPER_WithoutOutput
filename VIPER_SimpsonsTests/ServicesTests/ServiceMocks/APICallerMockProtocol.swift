//
//  APICallerMockProtocol.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 09.12.2021.
//

import UIKit
@testable import VIPER_Simpsons

protocol APICallerMockProtocol: APICallerProtocol {
	var getSimpsonQuotesStub: ((Int, @escaping (Result<[Quote], Error>) -> Void) -> Void)? { get set }
	func getSimpsonQuotes(count: Int, completion: @escaping (Result<[Quote], Error>) -> Void)
}
