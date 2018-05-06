//
//  DateSelectionCell.swift
//  OkDoc
//
//  Created by workmachine on 27.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

final class DateSelectionCell: UITableViewCell, XibInitializable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var timeView: TimeView!
    @IBOutlet weak var dateView: DateView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    deinit {
        print("deinit DateSelectionCell")
    }
}

extension DateSelectionCell {
    func setup(viewModel: DataSelectionViewModel) {
        timeView.times = viewModel.timeModels
        dateView.date = viewModel.dateModels
    }
}


