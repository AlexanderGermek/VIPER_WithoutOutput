//
//  ImageDataServiceProtocol.swift
//  VIPER_Simpsons
//
//  Created by iMac on 06.12.2021.
//

import UIKit

protocol ImageDataServiceProtocol {
	func convertToUIImage(from data: Data) -> UIImage?
	func downloadImage(from imageURL: URL, completion: @escaping ((UIImage?) -> Void))
}
