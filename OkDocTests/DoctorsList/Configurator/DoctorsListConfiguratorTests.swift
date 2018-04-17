//
//  DoctorsListDoctorsListConfiguratorTests.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import XCTest

class DoctorsListModuleConfiguratorTests: XCTestCase {

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
        let viewController = DoctorsListViewControllerMock()
        let configurator = DoctorsListModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "DoctorsListViewController is nil after configuration")
        XCTAssertTrue(viewController.output is DoctorsListPresenter, "output is not DoctorsListPresenter")

        let presenter: DoctorsListPresenter = viewController.output as! DoctorsListPresenter
        XCTAssertNotNil(presenter.view, "view in DoctorsListPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in DoctorsListPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is DoctorsListRouter, "router is not DoctorsListRouter")

        let interactor: DoctorsListInteractor = presenter.interactor as! DoctorsListInteractor
        XCTAssertNotNil(interactor.output, "output in DoctorsListInteractor is nil after configuration")
    }

    class DoctorsListViewControllerMock: DoctorsListViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
