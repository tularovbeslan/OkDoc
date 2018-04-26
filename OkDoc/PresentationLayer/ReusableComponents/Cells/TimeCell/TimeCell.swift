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
    override var isHighlighted: Bool {
        didSet {
            isSelected = isHighlighted
        }
    }

    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? .blue : UIColor.init(red: 241/255, green: 242/255, blue: 245/255, alpha: 1)
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
    func setCornerRadius() {
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
    }
    
    func setBackgroundColor() {
        contentView.backgroundColor = UIColor.init(red: 241/255, green: 242/255, blue: 245/255, alpha: 1)
    }
}

extension TimeCell {
    func setup(viewModel: TimeViewModel) {
        self.time.text = viewModel.time
    }
}
