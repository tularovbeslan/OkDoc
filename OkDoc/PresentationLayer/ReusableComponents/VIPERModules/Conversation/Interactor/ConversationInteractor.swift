//
//  ConversationConversationInteractor.swift
//  OkDoc
//
//  Created by Beslan Tularov on 27/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class ConversationInteractor: ConversationInteractorInput {

    weak var output: ConversationInteractorOutput!
	var storageManager: RealmManager!
	
	// MARK: - ConversationInteractorInput
	
	func insert(object: Message) {
		storageManager.create(object)
	}
}
