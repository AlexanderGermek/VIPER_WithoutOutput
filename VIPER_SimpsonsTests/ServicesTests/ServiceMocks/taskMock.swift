//
//  taskMock.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 10.12.2021.
//

import Foundation

final class TaskMock: URLSessionDataTask {
	private let data: Data?
	private let urlResponse: URLResponse?
	private let errorMock: Error?

	var completion: ((Data?, URLResponse?, Error?) -> Void)?

	init(data: Data?, urlResponse: URLResponse?, error: Error?) {
		self.data = data
		self.urlResponse = urlResponse
		self.errorMock = error
	}

	override func resume() {
		DispatchQueue.main.async {
			self.completion?(self.data, self.urlResponse, self.errorMock)
		}
	}
}
