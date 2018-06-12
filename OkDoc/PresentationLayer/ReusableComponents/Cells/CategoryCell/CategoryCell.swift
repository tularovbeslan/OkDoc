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
    
    // MARK: - Life cycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
		if #available(iOS 10.0, *) {
			let feedbackEnagine = FeedbackEngine()
			feedbackEnagine.feedback(type: .selection)
		}
    }
    
    deinit {
        print("deinit CategoryCell")
    }
}

extension CategoryCell {
    func setup(viewModel: CategoryViewModel) {
        title.text = viewModel.title
        subTitle.text = viewModel.subTitle
		if let photo = viewModel.photo {
			photoView.image = UIImage.init(named: photo)
		}
    }
}
