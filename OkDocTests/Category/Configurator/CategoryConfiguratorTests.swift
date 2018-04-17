//
//  CategoryCategoryConfiguratorTests.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import XCTest

class CategoryModuleConfiguratorTests: XCTestCase {

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
        let viewController = CategoryViewControllerMock()
        let configurator = CategoryModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "CategoryViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CategoryPresenter, "output is not CategoryPresenter")

        let presenter: CategoryPresenter = viewController.output as! CategoryPresenter
        XCTAssertNotNil(presenter.view, "view in CategoryPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CategoryPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CategoryRouter, "router is not CategoryRouter")

        let interactor: CategoryInteractor = presenter.interactor as! CategoryInteractor
        XCTAssertNotNil(interactor.output, "output in CategoryInteractor is nil after configuration")
    }

    class CategoryViewControllerMock: CategoryViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
