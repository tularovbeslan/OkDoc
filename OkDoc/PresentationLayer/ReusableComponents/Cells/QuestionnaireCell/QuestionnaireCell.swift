//
//  QuestionnaireCell.swift
//  OkDoc
//
//  Created by workmachine on 29.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

final class QuestionnaireCell: UITableViewCell, XibInitializable {
    
    // MARK: -
    @IBOutlet weak var questionFirst: UITextView!
    @IBOutlet weak var questionSecond: UITextView!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setTexViewsConfigure(textViews: [questionFirst, questionSecond])
    }
    
    // MARK: - Helpers
    func setTexViewsConfigure(textViews: [UITextView]) {
        textViews.forEach { (textView) in
            textView.clipsToBounds = true
            textView.layer.cornerRadius = 8
            textView.layer.borderWidth = 1
            textView.layer.borderColor = UIColor.init(red: 197/255, green: 211/255, blue: 228/255, alpha: 1).cgColor
        }
    }

}
