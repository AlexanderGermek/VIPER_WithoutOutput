//
//  URLSessionMock.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 10.12.2021.
//

import UIKit

final class URLSessionMock: URLSession {
	var cachedUrl: URL?
	private let taskMock: TaskMock

	init(data: Data?, urlResponse: URLResponse?, error: Error?) {
		taskMock = TaskMock(data: data, urlResponse: urlResponse, error: error)
	}

	override func dataTask(with url: URL,
						   completionHandler: @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		self.cachedUrl = url
		taskMock.completion = completionHandler
		return taskMock
	}
}
