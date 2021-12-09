//
//  ServiceLocatorMock.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 09.12.2021.
//

import Foundation
@testable import VIPER_Simpsons

final class ServiceLocatorMock: ServiceLocatorProtocol {

	var imageDataServiceMock: ImageDataServiceMock?
	var apiCallerMock: APICallerMock?

	var imageDataService: ImageDataServiceProtocol {
		imageDataServiceMock ?? ImageDataServiceMock()
	}

	var apiCaller: APICallerProtocol {
		apiCallerMock ?? APICallerMock()
	}

}
