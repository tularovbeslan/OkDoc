//
//  ProfileCommonInfoCell.swift
//  OkDoc
//
//  Created by Beslan Tularov on 13.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class ProfileCommonInfoCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profession: UILabel!
    @IBOutlet weak var experience: UILabel!
    @IBOutlet weak var language: UILabel!

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.experience.attributedText = setAttributed(string: "Стаж: 10 лет")
        self.language.attributedText = setAttributed(string: "Языки: русский, английский, немецкий")
    }
    
    // MARK: - Helpers
    func setRaiting(location: Int) -> NSAttributedString {
        let string = NSMutableAttributedString(string: "★★★★★")
        let range = NSRange(location: location, length: 5 - location )
        string.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red:226/255.0, green:230/255.0, blue:234/255.0, alpha: 1), range: range)
        return string
    }
    
    func setAttributed(string: String) -> NSAttributedString {
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

extension ProfileCommonInfoCell {
    func setup(viewModel: ProfileCommonInfoViewModel) {
        
    }
}
