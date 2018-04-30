//
//  AnalysisSelectionAnalysisSelectionConfiguratorTests.swift
//  OkDoc
//
//  Created by Beslan Tularov on 30/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import XCTest

class AnalysisSelectionModuleConfiguratorTests: XCTestCase {

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
        let viewController = AnalysisSelectionViewControllerMock()
        let configurator = AnalysisSelectionModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "AnalysisSelectionViewController is nil after configuration")
        XCTAssertTrue(viewController.output is AnalysisSelectionPresenter, "output is not AnalysisSelectionPresenter")

        let presenter: AnalysisSelectionPresenter = viewController.output as! AnalysisSelectionPresenter
        XCTAssertNotNil(presenter.view, "view in AnalysisSelectionPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in AnalysisSelectionPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is AnalysisSelectionRouter, "router is not AnalysisSelectionRouter")

        let interactor: AnalysisSelectionInteractor = presenter.interactor as! AnalysisSelectionInteractor
        XCTAssertNotNil(interactor.output, "output in AnalysisSelectionInteractor is nil after configuration")
    }

    class AnalysisSelectionViewControllerMock: AnalysisSelectionViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
