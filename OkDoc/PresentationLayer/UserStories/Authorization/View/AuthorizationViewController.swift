//
//  AuthorizationAuthorizationViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 10/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit
import PhoneNumberKit

class AuthorizationViewController: UIViewController {

	@IBOutlet weak var phoneTextField: PhoneNumberTextField!
	@IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
	@IBOutlet weak var nextButton: UIButton!
	
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTextField.layer.borderColor = UIColor.coldGray.cgColor
		phoneTextField.backgroundColor = .coldGray
		phoneTextField.maxDigits = 10
		
		setKeyboardNotifications()
		configureNextButton()
	}
	
	private func configureNextButton() {
		nextButton.setTitle("Далее", for: .normal)
		nextButton.layer.cornerRadius = 14
		nextButton.backgroundColor = UIColor(red:125/255.0, green:76/255.0, blue:245/255.0, alpha: 1)
	}
	
	deinit {
		destroyKeyboardNotifications()
	}
	
	@IBAction func next(_ sender: UIButton) {
		performSegue(withIdentifier: "RegistrationViewController", sender: nil)
	}
	
	private func setKeyboardNotifications() {
		NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard(notification:)), name: .UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard(notification:)), name: .UIKeyboardWillHide, object: nil)
	}
	
	private func destroyKeyboardNotifications() {
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
	}
	
	@objc private func handleKeyboard(notification: Notification) {
		guard let userInfo = notification.userInfo else { return }
		guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else {return}
		let isKeyboardShowing = notification.name == .UIKeyboardWillShow
		buttonBottomConstraint.constant = isKeyboardShowing ? keyboardFrame.height : 20
		UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
			self.view.layoutIfNeeded()
		}, completion: nil)
	}
	
}
