//
//  AnalysisSelectionCell.swift
//  OkDoc
//
//  Created by workmachine on 01.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class AnalysisSelectionCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var name: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setFontFor(label: name)
    }
    
    // MARK: - Helpers
    func setFontFor(label: UILabel) {
        label.font = UIFont.avertaCY(size: 16)
    }
}

extension AnalysisSelectionCell {
    func setup(viewModel: AnalysisSelectionViewModel) {
        name.text = viewModel.name
    }
}

