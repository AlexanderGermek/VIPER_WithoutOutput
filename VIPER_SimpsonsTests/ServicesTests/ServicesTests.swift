//
//  VIPER_SimpsonsTests.swift
//  VIPER_SimpsonsTests
//
//  Created by iMac on 28.11.2021.


import XCTest
import UIKit
import SDWebImage
@testable import VIPER_Simpsons

final class VIPER_SimpsonsTests: XCTestCase {

	var urlSession: URLSessionMock!
	var apiCaller: APICaller!

	override func setUp() {
		super.setUp()
		let jsonData = "[{\"quote\": \"quote1\",\"character\": \"Homer\", \"image\": \"https://via.placeholder.com/600/92c952\"}]".data(using: .utf8)
		urlSession = URLSessionMock(data: jsonData, urlResponse: nil, error: nil)
		apiCaller = APICaller(urlSession: urlSession)

	}

	override func tearDown() {
		urlSession = nil
		apiCaller = nil
		super.tearDown()
	}

	func testAPIPath() {
		//arrange
//		let urlSession = URLSessionMock()
//		let apiCaller = APICaller(urlSession: urlSession)

		//act
		apiCaller.getSimpsonQuotes(count: 10) { (_) in }

		//assert
		XCTAssertEqual(urlSession.cachedUrl?.host, "thesimpsonsquoteapi.glitch.me")
		XCTAssertEqual(urlSession.cachedUrl?.path, "/quotes")
	}

	func testResponse() {
		//arrange
		let quotesExpectation = expectation(description: "wait for response")
		var testQuotes: [Quote]?
		var testError: Error?
		
		//act
		apiCaller.getSimpsonQuotes(count: 5) { result in
			switch result {
			case .success(let quotes):
				testQuotes = quotes
			case .failure(let error):
				testError = error
			}
			quotesExpectation.fulfill()
		}

		//assert
		waitForExpectations(timeout: 4) { (error) in
			XCTAssertNotNil(testQuotes)
			XCTAssertNil(testError)
		}

	}

	func testImageDataService() {
		//arrange
//		let imageURL = URL(string: "https://via.placeholder.com/600/24f355")
//		var isImageDownload = false
//
//		//act
//		SDWebImageDownloader.shared.downloadImage(with: imageURL) { (_, data, error, success) in
//			isImageDownload = success
//		}
//
//		//assert
//		XCTAssertTrue(isImageDownload)
	}
}
