//
//  ConversationConversationConfiguratorTests.swift
//  OkDoc
//
//  Created by Beslan Tularov on 27/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import XCTest

class ConversationModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = ConversationViewControllerMock()
        let configurator = ConversationModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "ConversationViewController is nil after configuration")
        XCTAssertTrue(viewController.output is ConversationPresenter, "output is not ConversationPresenter")

        let presenter: ConversationPresenter = viewController.output as! ConversationPresenter
        XCTAssertNotNil(presenter.view, "view in ConversationPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in ConversationPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is ConversationRouter, "router is not ConversationRouter")

        let interactor: ConversationInteractor = presenter.interactor as! ConversationInteractor
        XCTAssertNotNil(interactor.output, "output in ConversationInteractor is nil after configuration")
    }

    class ConversationViewControllerMock: ConversationViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
