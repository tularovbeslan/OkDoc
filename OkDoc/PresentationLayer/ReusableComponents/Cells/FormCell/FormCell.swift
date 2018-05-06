//
//  FormCell.swift
//  OkDoc
//
//  Created by workmachine on 02.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

protocol FormCellDelegate: class {
    func textViewDidChange()
}

final class FormCell: UITableViewCell, XibInitializable {
    
    // MARK: - Properties
    weak var delegate: FormCellDelegate!
    
    // MARK: - IBOutlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var form: UITextView!
    @IBOutlet weak var formHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureTitle()
        configureForm()
    }
    
    deinit {
        print("deinit FormCell")
    }
    
    // MARK: Helpers
    private func configureTitle() {
        title.font = UIFont.avertaCY(size: 15)
        title.textColor = UIColor.init(red: 133/255, green: 147/255, blue: 164/255, alpha: 1)
    }
    
    private func configureForm() {
        form.font = UIFont.avertaCY(size: 18)
        form.textColor = .black
        form.layer.cornerRadius = 8
        form.backgroundColor = UIColor.init(red: 241/255, green: 242/255, blue: 245/255, alpha: 1)
        form.isScrollEnabled = false
        form.delegate = self
    }

}

extension FormCell {
    func setup(viewModel: FormViewModel) {
        title.text = viewModel.title
        form.text = viewModel.text
    }
}

extension FormCell: UITextViewDelegate {
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
            formHeightConstraint.constant = newHeight
            layoutIfNeeded()
            delegate.textViewDidChange()
        }
    }
}
