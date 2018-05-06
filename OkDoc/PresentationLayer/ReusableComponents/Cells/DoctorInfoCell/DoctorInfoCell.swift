//
//  DoctorInfoCell.swift
//  OkDoc
//
//  Created by Beslan Tularov on 11.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class DoctorInfoCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var experience: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var language: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        let width = photoView.frame.width
        configureRadius(layer: photoView.layer, radius: width / 2)
    }
    
    deinit {
        print("deinit DoctorInfoCell")
    }
    
    // MARK: - Helpers
    private func configureRadius(layer: CALayer, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    private func setRaiting(location: Int) -> NSAttributedString {
        let string = NSMutableAttributedString(string: "★★★★★")
        let range = NSRange(location: location, length: 5 - location )
        string.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red:226/255.0, green:230/255.0, blue:234/255.0, alpha: 1), range: range)
        return string
    }
    
    private func setAttributed(string: String) -> NSAttributedString {
        let components = string.components(separatedBy: ":")
        let atributedString = NSMutableAttributedString(string: string)
        if components.count > 1 {
            let length = components[0].count
            let location = 0
            let range = NSRange(location: location, length: length + 1)
            atributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red:159/255.0, green:171/255.0, blue:185/255.0, alpha: 1), range: range)
            return atributedString
        }
        return atributedString
    }
}

extension DoctorInfoCell {
    func setup(viewModel: DoctorsViewModel) {
        self.title.text = viewModel.title
        self.experience.attributedText = setAttributed(string: "Стаж: \(viewModel.experience) лет")
        self.photoView.image = UIImage.init(named: viewModel.photo)
        self.price.attributedText = setAttributed(string: "Приём: \(viewModel.price) руб.")
        self.language.attributedText = setAttributed(string: "Языки: \(viewModel.language)")
    }
}
