//
//  EmojiArt.swift
//  EmojiArt
//
//  Created by Rahimi, Meena Nichole (Student) on 5/28/19.
//  Copyright © 2019 Rahimi, Meena Nichole (Student). All rights reserved.
//

import Foundation

struct EmojiArt: Codable {
	
	/* this object is Codable with no other effort than saying it implements Codable since all of its vars' data types are Codable.  If that weren't true, could still make it Codable by adding init and encode methods */
	
	
	// MARK: Properties
	
	var url: URL?
	var imageData: Data?
	var emojis = [EmojiInfo]()
	
	struct EmojiInfo: Codable {
		let x: Int
		let y: Int
		let text: String
		let size: Int
	}
	
	/* if you wanted the JSON keys for this to be different, implement below example ...
	 private enum CodingKeys: String, CodingKey {
	    case url = "background_url"
	    case emojis
	 } */
	
	// MARK: Initialzier
	
	init(url: URL, emojis: [EmojiInfo]) {
		self.url = url
		self.emojis = emojis
	}
	
	// convert EmojiArt to json Data object
	var json: Data? { return try? JSONEncoder().encode(self) }
	
	// convert json Data object to EmojiArt
	init?(json: Data) {
		if let newValue = try? JSONDecoder().decode(EmojiArt.self, from: json) {
			self = newValue
		} else {
			return nil
		}
	}
	
	// for image took from camera
	init(imageData: Data, emojis: [EmojiInfo]) {
		self.imageData = imageData
		self.emojis = emojis
	}
}
