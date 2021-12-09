//
//  ImageDataServiceMock.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 09.12.2021.
//

import UIKit
@testable import VIPER_Simpsons

final class ImageDataServiceMock: ImageDataServiceMockProtocol {

	var downloadImageStub: ((URL, @escaping ((UIImage?) -> Void)) -> Void)?
	var convertToUIImageStub: ((Data) -> UIImage)?
	
	func convertToUIImage(from data: Data) -> UIImage? {
		convertToUIImageStub?(data)
	}

	func downloadImage(from imageURL: URL, completion: @escaping ((UIImage?) -> Void)) {
		downloadImageStub?(imageURL, completion)
	}


}
