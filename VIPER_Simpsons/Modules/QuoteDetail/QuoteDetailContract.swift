//
//  QuoteDetailContract.swift
//  VIPER
//
//  Created by iMac on 28.11.2021.
//

import UIKit

//MARK: Presenter Input
protocol PresenterQuoteDetailProtocol {
	var interactor: InteractorQuoteDetailProtocol? { get set }
	var router: RouterQuoteDetailProtocol? { get set }
	func didLoadView(completion: @escaping ((QuoteDetailViewModel) -> Void))
}

//MARK: Interactor Input
protocol InteractorQuoteDetailProtocol: class {
	var quote: Quote? { get }
	func getQuoteData(completion: @escaping ((QuoteDetailViewModel) -> Void))
}

//MARK: Router Input 
protocol RouterQuoteDetailProtocol: class {
	//navigation from detail screen
}

//MARK: Assembly Input
protocol QuoteDetailAssemblyProtocol {
	func createModule(with quote: Quote) -> UIViewController
}
