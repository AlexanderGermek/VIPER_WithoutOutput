//
//  QuotesPresenter.swift
//  VIPER
//
//  Created by iMac on 28.11.2021.
//

import UIKit

final class QuotesPresenter {
	//MARK: Properties
	var interactor: InteractorQuotesProtocol?
	var router: RouterQuotesProtocol?

	init(interactor: InteractorQuotesProtocol, router: RouterQuotesProtocol) {
		self.interactor = interactor
		self.router		= router
	}
}

//MARK: PresenterQuotesProtocol
extension QuotesPresenter: PresenterQuotesProtocol {
	func didLoadView(showHUDCompletion: (() -> Void), wasSuccessFetchQuotes: @escaping (Result<Void, Error>) -> Void) {
		showHUDCompletion()
		fetchQuotes(wasSuccessFetchQuotes: wasSuccessFetchQuotes)
	}
	
	func fetchQuotes(wasSuccessFetchQuotes: @escaping (Result<Void, Error>) -> Void) {
		interactor?.loadQuotes(wasSuccessFetchQuotes: wasSuccessFetchQuotes)
	}

	func getNumberOfQuotesInSection() -> Int {
		var numberOfRows: Int = 0
		interactor?.quotesInSection { count in
			numberOfRows = count ?? 0
		}
		return numberOfRows
	}


	func quoteText(indexPath: IndexPath) -> String {
		var quoteText = ""
		interactor?.getQuoteText(for: indexPath) { text in
			quoteText = text
		}
		return quoteText
	}

	func didSelectRowAt(index: Int, showHUDCompletion: @escaping (() -> Void)) {
		interactor?.checkQuote(at: index) { [weak self] quote in

			guard let strongSelf = self else { return }

			guard let quote = quote else {
				showHUDCompletion()
				return
			}

			strongSelf.router?.openQuoteDetailController(with: quote)
		}
	}

	func deselectRowAt(index: Int, deselectCompletion: @escaping (Int) -> Void) {
		deselectCompletion(index)
	}

	func showAlertWithError(completion: (() -> Void)) {
		completion()
	}
}
