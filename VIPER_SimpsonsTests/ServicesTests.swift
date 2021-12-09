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

	var urlSession: URLSession!
	var sbWebDownloader: SDWebImageDownloader!

	override func setUp() {
		super.setUp()
		urlSession = URLSession(configuration: .default)
	}

	override func tearDown() {
		urlSession = nil
		sbWebDownloader = nil
		super.tearDown()
	}

	func testAPI() {
		//arrange
		let urlString = "https://jsonplaceholder.typicode.com/users"
		//"https://thesimpsonsquoteapi.glitch.me/quotes?count=10"
		let url = URL(string: urlString)!
		var statusCode: Int?
		var responseError: Error?

		//act
		let dataTask = urlSession.dataTask(with: url) { _, response, error in
			statusCode = (response as? HTTPURLResponse)?.statusCode
			responseError = error
		}

		dataTask.resume()

		//assert
		XCTAssertNil(responseError)
		XCTAssertTrue(statusCode == 200)
	}

	func testImageDataService() {
		//arrange
		let imageURL = URL(string: "https://via.placeholder.com/600/24f355")
		var isImageDownload = false

		//act
		SDWebImageDownloader.shared.downloadImage(with: imageURL) { (_, data, error, success) in
			isImageDownload = success
		}

		//assert
		XCTAssertTrue(isImageDownload)
	}
}
