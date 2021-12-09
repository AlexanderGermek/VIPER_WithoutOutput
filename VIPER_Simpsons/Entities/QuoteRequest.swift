//
//  QuoteRequest.swift
//  VIPER
//
//  Created by iMac on 28.11.2021.
//

import Foundation

struct QuoteRequest: Decodable {
	let quotes: [Quote]
}

struct Quote: Decodable {
	let quote: String
	let character: String
	let image: String
//	let albumId: Int
//	let id: Int
//	let title: String
//	let url: String
}
