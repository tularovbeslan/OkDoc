//
//  ConsultationConsultationViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

final class ConsultationViewController: UIViewController, ConsultationViewInput, StoryboardInitializable {

    // MARK: - Properties
    var output: ConsultationViewOutput!
    lazy var segmentBar: SegmentBar = {
        let bar = SegmentBar(frame: .zero)
        bar.titles = ["Записи", "Завершенные"]
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()

    // MARK: - IBOutlets
    @IBOutlet weak var titlelb: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        configureSegmentBar()
        configureCategoryController()
    }

    // MARK: - IBActions
    @IBAction func menuDidPress(_ sender: UIButton) {
        let feedbackEngine = FeedbackEngine.init()
        feedbackEngine.feedback(type: .impact(.medium))
    }

    // MARK: - ConsultationViewInput
    func setupInitialState() {
        
    }
    
    func setTitleLabel(text: String) {
        titlelb.text = text
    }
    
    func setNavigationBarBackButton(title: String) {
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
        let dialogs = DialogsViewController.fromStoryboard()
        addChildViewController(dialogs)
        dialogs.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dialogs.view)
        
        dialogs.view.topAnchor.constraint(equalTo: segmentBar.bottomAnchor, constant: 5).isActive = true
        dialogs.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        dialogs.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        dialogs.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        dialogs.didMove(toParentViewController: self)
    }
}
