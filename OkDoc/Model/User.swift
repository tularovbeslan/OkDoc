//
//  User.swift
//  OkDoc
//
//  Created by workmachine on 11.06.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct User: Codable {
	let id: Int?
	let name: String?
	let phone: Int?
	let avatar: String?
	let email: String?
	let description: String?
	let price: Float?
	let isOnline: Int?
	let createdAt: String?
	let updatedAt: String?
	let pivot: Pivot?
	
	struct Pivot: Codable {
		let doctorsCategoryID: Int?
		let userID: Int?
		
		enum CodingKeys: String, CodingKey {
			case doctorsCategoryID = "doctors_category_id"
			case userID = "user_id"
		}
	}
}

extension User {
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case phone
		case avatar
		case email
		case description
		case price
		case isOnline 	= "is_online"
		case createdAt 	= "created_at"
		case updatedAt 	= "updated_at"
		case pivot
	}
}
