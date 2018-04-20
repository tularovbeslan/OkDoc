//
//  CategorySelectionCategorySelectionViewController.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

final class CategorySelectionViewController: UIViewController, CategorySelectionViewInput, StoryboardInitializable {

    var output: CategorySelectionViewOutput!
    
    
    lazy var segmentBar: SegmentBar = {
        let bar = SegmentBar(frame: .zero)
        bar.titles = ["Взрослые", "Дети"]
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    @IBOutlet weak var titlelb: UILabel!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        configureSegmentBar()
        configureCategoryController()
    }
    
    // MARK: - IBActions
    @IBAction func menuDidPress(_ sender: UIButton) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }

    // MARK: CategorySelectionViewInput
    func setupInitialState() {
        
    }
    
    func navigationBarBackButton(title: String) {
        navigationItem.leftBarButtonItem?.title = title
    }
    
    // MARK: - Helpers
    func configureSegmentBar() {
        view.addSubview(segmentBar)
        segmentBar.topAnchor.constraint(equalTo: titlelb.bottomAnchor, constant: 15).isActive = true
        segmentBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        segmentBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        segmentBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func configureCategoryController() {
        let category = CategoryViewController.fromStoryboard()
        addChildViewController(category)
        category.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(category.view)
        
        category.view.topAnchor.constraint(equalTo: segmentBar.bottomAnchor, constant: 5).isActive = true
        category.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        category.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        category.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        category.didMove(toParentViewController: self)
    }
}
