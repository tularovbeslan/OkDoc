//
//  CategorySelectionCategorySelectionViewController.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

final class CategorySelectionViewController: UIViewController, CategorySelectionViewInput, StoryboardInitializable {

    // MARK: - Properties
    var output: CategorySelectionViewOutput!
    
    // MARK: - IBOutlets
    @IBOutlet weak var titlelb: UILabel!
    @IBOutlet weak var segmentBar: SegmentBar!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    deinit {
        print("deinit CategorySelectionViewController")
    }
    
    // MARK: - IBActions
    @IBAction func menuDidPress(_ sender: UIButton) {
        output.menuButtonDidPress()
    }

    // MARK: - CategorySelectionViewInput
    func setupInitialState() {
        segmentBar.createViewModel(titles: ["Взрослые", "Дети"])
    }
    
    func setTitleLabel(text: String) {
        titlelb.text = text
    }
    
    func setNavigationBarBackButton(title: String) {
        navigationItem.leftBarButtonItem?.title = title
    }
}
