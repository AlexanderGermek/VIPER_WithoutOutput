//
//  QuoteDetailPresenter.swift
//  VIPER
//
//  Created by iMac on 28.11.2021.
//

import Foundation

final class QuoteDetailPresenter: PresenterQuoteDetailProtocol {
	//MARK: Properties
	var interactor: InteractorQuoteDetailProtocol?
	var router: RouterQuoteDetailProtocol?

	//MARK: Init
	init(interactor: InteractorQuoteDetailProtocol, router: RouterQuoteDetailProtocol) {
		self.interactor = interactor
		self.router 	= router
	}

	//MARK: didLoadView
	func didLoadView(completion: @escaping ((QuoteDetailViewModel) -> Void)) {
		interactor?.getQuoteData(completion: completion)
	}
}
