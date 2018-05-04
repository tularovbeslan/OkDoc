//
//  TimeCell.swift
//  OkDoc
//
//  Created by workmachine on 23.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class TimeCell: UICollectionViewCell {
    
    // MARK: - Properties
    override var isSelected: Bool {
        didSet {
            let feedbackEnagine = FeedbackEngine()
            feedbackEnagine.feedback(type: .selection)
            contentView.backgroundColor = isSelected ? UIColor(red:2/255.0, green:123/255.0, blue:255/255.0, alpha: 1) : UIColor.init(red: 241/255, green: 242/255, blue: 245/255, alpha: 1)
            time.textColor = isSelected ? .white : .black
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var time: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        setCornerRadius()
        setBackgroundColor()
    }
    
    // MARK: - Helpers
    private func setCornerRadius() {
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
    }
    
    private func setBackgroundColor() {
        contentView.backgroundColor = UIColor.init(red: 241/255, green: 242/255, blue: 245/255, alpha: 1)
    }
}

extension TimeCell {
    func setup(viewModel: TimeViewModel) {
        self.time.text = viewModel.time
    }
}
