//
//  SegmentCell.swift
//  OkDoc
//
//  Created by Beslan Tularov on 12.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class SegmentCell: UICollectionViewCell {
    
    // MARK: - Properties
    var feedbackEngine: FeedbackEngine!
    override var isHighlighted: Bool {
        didSet {
            title.textColor = isHighlighted ? .black : UIColor(red:159/255.0, green:171/255.0, blue:185/255.0, alpha: 1)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            feedbackEngine.feedback(type: .selection)
            title.textColor = isSelected ? .black : UIColor(red:159/255.0, green:171/255.0, blue:185/255.0, alpha: 1)
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var title: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        feedbackEngine = FeedbackEngine()
    }
    
    deinit {
        print("deinit SegmentCell")
    }
}

extension SegmentCell {
    func setup(viewModel: SegmentViewModel) {
        self.title.text = viewModel.title
    }
}
