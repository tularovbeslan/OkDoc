//
//  BubbleBuilder.swift
//  OkDoc
//
//  Created by workmachine on 03.06.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import RealmSwift
import AsyncDisplayKit

class BubbleBuilder {
	
	private var model: Message!
	
	init(threadSafeReference: ThreadSafeReference<Message>) {
		let realm = try! Realm()
		guard let model = realm.resolve(threadSafeReference) else { return }
		self.model = model
	}
	
	public func build() -> ASCellNode{
		if model.incomming {
			if model.imageData == nil {
				let node = InCommingDefaultCell.init(model: model)
				return node
			} else {
				let node = InCommingImageCell.init(model: model)
				return node
			}
		} else {
			if model.imageData == nil {
				let node = OutCommingDefaultCell.init(model: model)
				return node
			} else {
				let node = OutCommingImageCell.init(model: model)
				return node
			}
		}
	}
}
