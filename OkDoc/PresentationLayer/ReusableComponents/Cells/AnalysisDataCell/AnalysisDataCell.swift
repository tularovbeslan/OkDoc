//
//  AnalysisDataCell.swift
//  OkDoc
//
//  Created by workmachine on 27.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class AnalysisDataCell: UICollectionViewCell {
    
    // MARK: - Properties
    private let grayColor = UIColor.init(red: 241/255, green: 241/255, blue: 245/255, alpha: 1)
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var emptyIcon: UIImageView!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        setEmptyIcon(image: UIImage.init(named: "plus"))
        configureImageView()
    }
    
    // MARK: - Helpers
    private func emptyIcon(isHidden: Bool) {
        emptyIcon.isHidden = isHidden
    }
    
    private func setEmptyIcon(image: UIImage?) {
        emptyIcon.image = image
    }
    
    private func configureImageView() {
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.backgroundColor = grayColor
    }
    
}

extension AnalysisDataCell {
    func setup(viewModel: AnalysisDataViewModel) {
        self.imageView.image = viewModel.image
        self.title.text = viewModel.title
        emptyIcon(isHidden: self.imageView.image != nil)
    }
}
