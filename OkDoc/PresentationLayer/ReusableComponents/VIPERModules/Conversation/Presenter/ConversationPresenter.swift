//
//  ConversationConversationPresenter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 27/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class ConversationPresenter: ConversationModuleInput, ConversationViewOutput, ConversationInteractorOutput {

    weak var view: ConversationViewInput!
    var interactor: ConversationInteractorInput!
    var router: ConversationRouterInput!

	// MARK: - ConversationViewOutput
    func viewIsReady() {
		view.setupInitialState()
    }
	
	func send(object: Message) {
		interactor.insert(object: object)
	}

}
