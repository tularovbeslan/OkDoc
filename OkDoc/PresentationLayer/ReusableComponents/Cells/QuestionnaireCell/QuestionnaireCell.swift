//
//  QuestionnaireCell.swift
//  OkDoc
//
//  Created by workmachine on 29.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

protocol QuestionnaireCellDelegate: class {
    func textViewDidChange()
}

final class QuestionnaireCell: UITableViewCell, XibInitializable {
    // MARK: - Properties
    weak var delegate: QuestionnaireCellDelegate!
    
    // MARK: - IBOutlets
    @IBOutlet weak var questionFirst: UITextView!
    @IBOutlet weak var questionSecond: UITextView!
    @IBOutlet weak var enroll: UIButton!
    @IBOutlet weak var questionFirstHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var questionSecondHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setTexViewsConfigure(textViews: [questionFirst, questionSecond])
        configureEnroll()
    }
    
    // MARK: - Helpers
    private func setTexViewsConfigure(textViews: [UITextView]) {
        textViews.forEach { [weak self] (textView) in
            textView.delegate = self
            textView.clipsToBounds = true
            textView.layer.cornerRadius = 8
            textView.layer.borderWidth = 1
            textView.layer.borderColor = UIColor.init(red: 197/255, green: 211/255, blue: 228/255, alpha: 1).cgColor
        }
    }
    
    private func configureEnroll() {
        enroll.setTitle("Записаться", for: .normal)
        enroll.layer.cornerRadius = 14
        enroll.backgroundColor = UIColor(red:125/255.0, green:76/255.0, blue:245/255.0, alpha: 1)
    }
}

extension QuestionnaireCell: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newHeight = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude)).height
        if textView.frame.height < newHeight {
            if textView == questionFirst {
                questionFirstHeightConstraint.constant = newHeight
            } else if textView == questionSecond {
                questionSecondHeightConstraint.constant = newHeight
            }
            layoutIfNeeded()
            delegate.textViewDidChange()
        }
    }
}
