//
//  QuoteDetailInteractor.swift
//  VIPER
//
//  Created by iMac on 28.11.2021.
//

import Foundation
import SDWebImage

final class QuoteDetailInteractor: InteractorQuoteDetailProtocol {
	//MARK: Properties
	internal let quote: Quote?
	private var serviceLocator: ServiceLocatorProtocol = ServiceLocator()

	//MARK: Init
	init(quote: Quote) {
		self.quote = quote
	}

	//MARK: Func's
	func getQuoteData(completion: @escaping ((QuoteDetailViewModel) -> Void)) {
		guard let quote = quote, let imageURL = URL(string: quote.image) else { return }
		//guard let quote = quote, let imageURL = URL(string: quote.url) else { return }
		var image: UIImage?
		let group = DispatchGroup()
		group.enter()
		serviceLocator.imageDataService.downloadImage(from: imageURL) { downloadedImage in
			image = downloadedImage
			group.leave()
		}

		group.notify(queue: .main) {
			let quoteViewModel = QuoteDetailViewModel(character: quote.character,
													  quoteText: quote.quote,
													  characterImage: image)
			completion(quoteViewModel)
		}
	}
}
