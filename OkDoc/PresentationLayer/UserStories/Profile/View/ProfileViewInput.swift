//
//  ProfileProfileViewInput.swift
//  OkDoc
//
//  Created by Beslan Tularov on 02/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

protocol ProfileViewInput: class {

    /**
        @author Beslan Tularov
        Setup initial state of the view
    */
    func setTitle(text: String)
    func setupInitialState()
}
