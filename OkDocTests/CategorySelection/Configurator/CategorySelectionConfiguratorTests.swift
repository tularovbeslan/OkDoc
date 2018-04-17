//
//  CategorySelectionCategorySelectionConfiguratorTests.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import XCTest

class CategorySelectionModuleConfiguratorTests: XCTestCase {

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
        let viewController = CategorySelectionViewControllerMock()
        let configurator = CategorySelectionModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "CategorySelectionViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CategorySelectionPresenter, "output is not CategorySelectionPresenter")

        let presenter: CategorySelectionPresenter = viewController.output as! CategorySelectionPresenter
        XCTAssertNotNil(presenter.view, "view in CategorySelectionPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CategorySelectionPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CategorySelectionRouter, "router is not CategorySelectionRouter")

        let interactor: CategorySelectionInteractor = presenter.interactor as! CategorySelectionInteractor
        XCTAssertNotNil(interactor.output, "output in CategorySelectionInteractor is nil after configuration")
    }

    class CategorySelectionViewControllerMock: CategorySelectionViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
