//
//  ServiceLocator.swift
//  VIPER_Simpsons
//
//  Created by iMac on 06.12.2021.
//

import Foundation

final class ServiceLocator: ServiceLocatorProtocol {
	lazy var imageDataService: ImageDataServiceProtocol = ImageDataService()
	lazy var apiCaller: APICallerProtocol = APICaller()
}
