//
//  ImageDataServiceMockProtocol.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 09.12.2021.
//

import UIKit
@testable import VIPER_Simpsons

protocol ImageDataServiceMockProtocol: ImageDataServiceProtocol {
	var downloadImageStub: ((URL, @escaping ((UIImage?) -> Void)) -> Void)? { get set }
	var convertToUIImageStub: ((Data) -> UIImage)? { get }

	func convertToUIImage(from data: Data) -> UIImage?
	func downloadImage(from imageURL: URL, completion: @escaping ((UIImage?) -> Void))
}
