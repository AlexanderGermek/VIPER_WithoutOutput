//
//  ServiceLocatorProtocol.swift
//  VIPER_Simpsons
//
//  Created by iMac on 06.12.2021.
//

import Foundation

protocol ServiceLocatorProtocol: class {
	var imageDataService: ImageDataServiceProtocol { get }
	var apiCaller: APICallerProtocol { get }
}
