//
//  ConversationConversationViewOutput.swift
//  OkDoc
//
//  Created by Beslan Tularov on 27/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

protocol ConversationViewOutput {

    /**
        @author Beslan Tularov
        Notify presenter that view is ready
    */

    func viewIsReady()
	func send(object: Message)
}
