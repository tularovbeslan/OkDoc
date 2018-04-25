//
//  TimeCell.swift
//  OkDoc
//
//  Created by workmachine on 23.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class TimeCell: UICollectionViewCell {
    
    @IBOutlet weak var time: UILabel!

    override var isSelected: Bool {
        didSet {
            backgroundColor = .blue
        }
    }
}

extension TimeCell {
    func setup(viewModel: TimeViewModel) {
        self.time.text = viewModel.time
    }
}
