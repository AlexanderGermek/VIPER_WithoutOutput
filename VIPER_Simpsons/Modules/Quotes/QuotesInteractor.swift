//
//  QuotesInteractor.swift
//  VIPER
//
//  Created by iMac on 28.11.2021.
//

import Foundation

final class QuotesInteractor: InteractorQuotesProtocol {

	//MARK: - Properties
	private var quotes: [Quote]?
	private var serviceLocator: ServiceLocatorProtocol!

	//MARK: - Init
	init(serviceLocator: ServiceLocatorProtocol) {
		self.serviceLocator = serviceLocator
	}

	//MARK: - Functions
	func loadQuotes(wasSuccessFetchQuotes: @escaping (Result<Void, Error>) -> Void) {
		let quotesCount = 10
		serviceLocator.apiCaller.getSimpsonQuotes(count: quotesCount) { [weak self ] result in
			switch result {
			case .success(let quotes):
				self?.quotes = quotes
				wasSuccessFetchQuotes(.success(()))
			case .failure(let error):
				wasSuccessFetchQuotes(.failure(error))
			}
		}
	}

	func checkQuote(at index: Int, completion: @escaping ((Quote?) -> Void)) {
		guard let quotes = self.quotes, quotes.indices.contains(index) else {
			completion(nil)
			return
		}
		completion(quotes[index])
	}

	func quotesInSection(quotesNumberCompletion: @escaping (Int?) -> Void) {
		guard let count = quotes?.count else {
			quotesNumberCompletion(nil)
			return
		}
		quotesNumberCompletion(count)
	}

	func getQuoteText(for indexPath: IndexPath, quoteTextCompletion: @escaping ((String) -> Void)) {
		guard let quotes = quotes else { return }
		quoteTextCompletion(quotes[indexPath.row].quote)
	}
}
