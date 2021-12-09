//
//  ServiceLocatorMock.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 09.12.2021.
//

import Foundation
@testable import VIPER_Simpsons

final class ServiceLocatorMock: ServiceLocatorProtocol {
	var imageDataService: ImageDataServiceProtocol = ImageDataService()

	var apiCaller: APICallerProtocol = APICaller()
}
