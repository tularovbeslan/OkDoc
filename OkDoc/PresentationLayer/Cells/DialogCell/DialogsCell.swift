//
//  DialogsCell.swift
//  OkDoc
//
//  Created by workmachine on 22.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class DialogsCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profession: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var dateBackgroundView: UIView!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let feedbackEnagine = FeedbackEngine()
        feedbackEnagine.feedback(type: .selection)
        
        configureDateBackground()
        configurePhotoView()
        setDateText(color: UIColor.init(red: 160/255, green: 171/255, blue: 184/255, alpha: 1))
    }
    
    func configureDateBackground() {
        dateBackgroundView.backgroundColor = UIColor.init(red: 2/255, green: 123/255, blue: 255/255, alpha: 1)
        dateBackgroundView.layer.cornerRadius = 8
        dateBackgroundView.clipsToBounds = true
    }
    
    func configurePhotoView() {
        photoView.layer.cornerRadius = photoView.frame.width / 2
        photoView.clipsToBounds = true
        photoView.contentMode = .scaleAspectFit
    }
    
    func setDateText(color: UIColor) {
        profession.textColor = color
    }
}

extension DialogsCell {
    func setup(viewModel: DialogsViewModel) {
        self.name.text = viewModel.name
        self.profession.text = viewModel.profession
        self.date.text = viewModel.date
        self.photoView.image = UIImage.init(named: viewModel.photo)
    }
}

