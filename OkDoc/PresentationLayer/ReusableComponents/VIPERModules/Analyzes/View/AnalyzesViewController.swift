//
//  AnalyzesAnalyzesViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class AnalyzesViewController: UIViewController, AnalyzesViewInput {

    var output: AnalyzesViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AnalyzesViewInput
    func setupInitialState() {
    }
}
