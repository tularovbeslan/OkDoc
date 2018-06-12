//
//  Category.swift
//  OkDoc
//
//  Created by workmachine on 11.06.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct Category: Codable {
	let id: Int?
	let name: String?
	let isAdult: Int?
	let createdAt: String?
	let updatedAt: String?
	let users: [User]?
}

extension Category {
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case isAdult = "is_adult"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
		case users
	}
}
