//
//  QuotesContract.swift
//  VIPER
//
//  Created by iMac on 28.11.2021.
//

import UIKit

//MARK: Presenter Input
protocol PresenterQuotesProtocol {
	func didLoadView(showHUDCompletion: (() -> Void),
					 wasSuccessFetchQuotes: @escaping (Result<Void, Error>) -> Void)
	
	func fetchQuotes(wasSuccessFetchQuotes: @escaping (Result<Void, Error>) -> Void)
	func getNumberOfQuotesInSection() -> Int
	func quoteText(indexPath: IndexPath) -> String
	func didSelectRowAt(index: Int, showHUDCompletion: @escaping (() -> Void))
	func deselectRowAt(index: Int, deselectCompletion: @escaping (Int) -> Void)
	func showAlertWithError(completion: (() -> Void))
}

//MARK: Interactor Input
protocol InteractorQuotesProtocol {
	func getQuoteText(for indexPath: IndexPath, quoteTextCompletion: @escaping ((String) -> Void)) 
	func loadQuotes(wasSuccessFetchQuotes: @escaping (Result<Void, Error>) -> Void)
	func checkQuote(at index: Int, completion: @escaping (Quote?) -> Void)
	func quotesInSection(quotesNumberCompletion: @escaping (Int?) -> Void)
}

//MARK: Router Input
protocol RouterQuotesProtocol: class {
	func openQuoteDetailController(with quote: Quote)
}

//MARK: Assembly Input
protocol AssemblyQuotesProtocol: class {
	func createModule() -> UINavigationController
}
