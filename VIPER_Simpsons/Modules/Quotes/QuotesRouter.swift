//
//  QuotesRouter.swift
//  VIPER
//
//  Created by iMac on 28.11.2021.
//

import UIKit

final class QuotesRouter: RouterQuotesProtocol {
	//MARK: - Navigation
	internal func openQuoteDetailController(with quote: Quote) {
		guard let navigationController = UIApplication.shared.windows.first?.rootViewController
			   as? UINavigationController else { return }
		let quoteDetailVC = QuoteDetailAssembly().createModule(with: quote)
		navigationController.pushViewController(quoteDetailVC, animated: true)
	}
}
