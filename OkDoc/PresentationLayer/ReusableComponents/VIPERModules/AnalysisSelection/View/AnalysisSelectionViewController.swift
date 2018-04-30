//
//  AnalysisSelectionAnalysisSelectionViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 30/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class AnalysisSelectionViewController: UIViewController, AnalysisSelectionViewInput {

    var output: AnalysisSelectionViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AnalysisSelectionViewInput
    func setupInitialState() {
    }
}
