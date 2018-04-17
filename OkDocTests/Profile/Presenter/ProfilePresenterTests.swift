//
//  ProfileProfilePresenterTests.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import XCTest

class ProfilePresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: ProfileInteractorInput {

    }

    class MockRouter: ProfileRouterInput {

    }

    class MockViewController: ProfileViewInput {

        func setupInitialState() {

        }
    }
}
