//
//  SegmentSegmentConfiguratorTests.swift
//  OkDoc
//
//  Created by Беслан Тулров on 12/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import XCTest

class SegmentModuleConfiguratorTests: XCTestCase {

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
        let viewController = SegmentViewControllerMock()
        let configurator = SegmentModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "SegmentViewController is nil after configuration")
        XCTAssertTrue(viewController.output is SegmentPresenter, "output is not SegmentPresenter")

        let presenter: SegmentPresenter = viewController.output as! SegmentPresenter
        XCTAssertNotNil(presenter.view, "view in SegmentPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in SegmentPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is SegmentRouter, "router is not SegmentRouter")

        let interactor: SegmentInteractor = presenter.interactor as! SegmentInteractor
        XCTAssertNotNil(interactor.output, "output in SegmentInteractor is nil after configuration")
    }

    class SegmentViewControllerMock: SegmentViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
