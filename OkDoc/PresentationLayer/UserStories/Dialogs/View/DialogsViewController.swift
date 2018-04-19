//
//  DialogsDialogsViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class DialogsViewController: UIViewController, DialogsViewInput {

    var output: DialogsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: DialogsViewInput
    func setupInitialState() {
    }
}
