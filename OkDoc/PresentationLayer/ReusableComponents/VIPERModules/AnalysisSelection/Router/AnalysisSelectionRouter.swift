//
//  AnalysisSelectionAnalysisSelectionRouter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 30/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit.UIAlertController

class AnalysisSelectionRouter: AnalysisSelectionRouterInput {
    weak var transitionHandler: TransitionHandler!
    private let imagePicker = UIImagePickerController()

    func showActionSheet(text: String) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
		let messageAttrString = NSMutableAttributedString(string: text, attributes: [NSAttributedStringKey.font: UIFont.avertaCY(style: .Semibold, size: 15)])
        alert.setValue(messageAttrString, forKey: "attributedMessage")
        
        alert.addAction(UIAlertAction(title: "Выбрать из галереи", style: .default , handler:{ [weak self] (UIAlertAction)in
            self?.imagePicker.allowsEditing = false
            self?.imagePicker.sourceType = .photoLibrary
            self?.imagePicker.delegate = self?.transitionHandler as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            guard let picker = self?.imagePicker  else { return }
            self?.transitionHandler.present(picker, animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Сфотографировать", style: .default , handler:{ [weak self] (UIAlertAction)in
            self?.imagePicker.allowsEditing = false
            self?.imagePicker.sourceType = .camera
            self?.imagePicker.delegate = self?.transitionHandler as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            guard let picker = self?.imagePicker  else { return }
            self?.transitionHandler.present(picker, animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler:nil))
        transitionHandler.present(alert, animated: true)
    }
    
}
