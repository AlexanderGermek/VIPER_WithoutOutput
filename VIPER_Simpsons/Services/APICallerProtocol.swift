//
//  APICallerProtocol.swift
//  VIPER_Simpsons
//
//  Created by iMac on 06.12.2021.
//

import Foundation

protocol APICallerProtocol {
	func getSimpsonQuotes(count: Int, completion: @escaping (Result<[Quote], Error>) -> Void)
}
