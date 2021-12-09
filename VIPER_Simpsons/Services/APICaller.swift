//
//  APIService.swift
//  VIPER
//
//  Created by iMac on 28.11.2021.
//

import Foundation

final class APICaller: APICallerProtocol {
	//MARK: - Properties
	private struct Constants {
		static let baseURL = "https://thesimpsonsquoteapi.glitch.me" //"https://jsonplaceholder.typicode.com//"
		static let quotes = "/quotes" //"/photos"
	}

	private enum HTTPMethod: String {
		case GET
		case POST
		case DELETE
		case PUT
	}

	private enum APICallerErrors: Error {
		case failedToGetData
	}

	//MARK: - Public func's
	public func getSimpsonQuotes(count: Int, completion: @escaping (Result<[Quote], Error>) -> Void) {
		guard let url = URL(string: Constants.baseURL + Constants.quotes + "?count=\(count)") else {
			return
		}

		let task = URLSession.shared.dataTask(with: url) { data, _, error in
			guard let data = data, error == nil else {
				completion(.failure(APICallerErrors.failedToGetData))
				return
			}

			do {
//test
//				let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//				print(json)
				let response = try JSONDecoder().decode([Quote].self, from: data)
				completion(.success(response))
			} catch {
				completion(.failure(error))
			}
		}
		
		task.resume()
	}
}
