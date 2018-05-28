//
//  ConversationConversationInitializer.swift
//  OkDoc
//
//  Created by Beslan Tularov on 27/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class ConversationModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var conversationViewController: ConversationViewController!

    override func awakeFromNib() {

        let configurator = ConversationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: conversationViewController)
    }

}
