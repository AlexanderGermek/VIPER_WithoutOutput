//
//  QuotesAssembly.swift
//  VIPER_Simpsons
//
//  Created by iMac on 05.12.2021.
//

import UIKit

final class QuotesAssembly: AssemblyQuotesProtocol {
	func createModule() -> UINavigationController {
		let router: RouterQuotesProtocol = QuotesRouter()
		let interactor: InteractorQuotesProtocol = QuotesInteractor(serviceLocator: ServiceLocator.service)
		let presenter: PresenterQuotesProtocol = QuotesPresenter(interactor: interactor, router: router)
		let quotesVC = QuotesViewController(presenter: presenter)
		let navigationController = UINavigationController(rootViewController: quotesVC)
		return navigationController
	}
}
