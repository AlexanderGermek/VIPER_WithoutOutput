//
//  APICallerMock.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 09.12.2021.
//

import Foundation
@testable import VIPER_Simpsons

final class APICallerMock: APICallerProtocol {

	//var getSimpsonQuotesStub

	func getSimpsonQuotes(count: Int, completion: @escaping (Result<[Quote], Error>) -> Void) {
		//
	}


}
