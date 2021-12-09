//
//  QuoteDetailAssembly.swift
//  VIPER_Simpsons
//
//  Created by iMac on 06.12.2021.
//

import UIKit

final class QuoteDetailAssembly: QuoteDetailAssemblyProtocol {
	func createModule(with quote: Quote) -> UIViewController {
		let router: RouterQuoteDetailProtocol = QuoteDetailRouter()
		let interactor: InteractorQuoteDetailProtocol = QuoteDetailInteractor(
			quote: quote,
			serviceLocator: ServiceLocator.service)
		let presenter: PresenterQuoteDetailProtocol = QuoteDetailPresenter(interactor: interactor, router: router)
		let quoteDetailVC = QuoteDetailViewController(presenter: presenter)
		return quoteDetailVC
	}
}
