//
//  CategoryCell.swift
//  OkDoc
//
//  Created by Beslan Tularov on 03.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var photoView: UIImageView!
}

extension CategoryCell {
    func setup(viewModel: CategoryViewModel) {
        title.text = viewModel.title
        subTitle.text = viewModel.subTitle
        photoView.image = UIImage.init(named: viewModel.photo)
    }
}
