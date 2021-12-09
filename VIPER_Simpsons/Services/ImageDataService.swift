//
//  ImageDataService.swift
//  VIPER
//
//  Created by iMac on 28.11.2021.
//

import UIKit
import SDWebImage

final class ImageDataService: ImageDataServiceProtocol {

	func convertToUIImage(from data: Data) -> UIImage? {
		return UIImage(data: data)
	}

	func downloadImage(from imageURL: URL, completion: @escaping ((UIImage?) -> Void)) {
		
		SDWebImageDownloader.shared.downloadImage(with: imageURL) { [weak self] (_, data, error, success) in
			guard let data = data, error == nil else { return }
			var image: UIImage?
			if success {
				image = self?.convertToUIImage(from: data)
			}
			completion(image)
		}
	}
}
