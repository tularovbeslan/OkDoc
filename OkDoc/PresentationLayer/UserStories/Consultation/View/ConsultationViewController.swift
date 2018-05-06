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

    // MARK: - IBOutlets
    @IBOutlet weak var titlelb: UILabel!
    @IBOutlet weak var segmentBar: SegmentBar!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        segmentBar.createViewModel(titles: ["Записи", "Завершенные"])
    }
    
    deinit {
        print("deinit ConsultationViewController")
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
}
