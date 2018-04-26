//
//  DateCell.swift
//  OkDoc
//
//  Created by workmachine on 26.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class DateCell: UICollectionViewCell {
    
    // MARK: - Properties
    override var isHighlighted: Bool {
        didSet {
            isSelected = isHighlighted
        }
    }
    
    override var isSelected: Bool {
        didSet {
            weekDay.textColor = isSelected ? .black : UIColor.init(red: 159/255, green: 171/255, blue: 185/255, alpha: 1)
            date.textColor = isSelected ? .black : UIColor.init(red: 159/255, green: 171/255, blue: 185/255, alpha: 1)
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var weekDay: UILabel!
    @IBOutlet weak var date: UILabel!

    // MARK: - Life cycle
    override func awakeFromNib() {
        setTitlesColor()
    }
    
    // MARK: - Helpers
    func setTitlesColor() {
        weekDay.textColor = UIColor.init(red: 241/255, green: 242/255, blue: 245/255, alpha: 1)
        date.textColor = UIColor.init(red: 241/255, green: 242/255, blue: 245/255, alpha: 1)
    }
}

extension DateCell {
    func setup(viewModel: DateViewModel) {
        self.weekDay.text = viewModel.weekDay
        self.date.text = viewModel.date
    }
}
