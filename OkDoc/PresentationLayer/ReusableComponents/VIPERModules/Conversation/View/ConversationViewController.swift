//
//  ConversationConversationViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 27/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit
import GrowingTextView

class ConversationViewController: UIViewController, ConversationViewInput {

    var output: ConversationViewOutput!
	
	@IBOutlet weak var bottomConstraint: NSLayoutConstraint!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var growingTextView: GrowingTextView!
	@IBOutlet weak var timerLabel: UILabel!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
		automaticallyAdjustsScrollViewInsets = false
        output.viewIsReady()
		setupTableView()
    }
	
	deinit {
		destroyKeyboardNotifications()
	}


    // MARK: ConversationViewInput
    func setupInitialState() {
		setKeyboardNotifications()
		setupTexField()
    }
	
	// MARK: - Helpers
	private func setupTexField() {
		growingTextView.trimWhiteSpaceWhenEndEditing = false
		growingTextView.placeholder = "Сообщение..."
		growingTextView.placeholderColor = UIColor.sweetGray
		growingTextView.minHeight = 34.0
		growingTextView.maxHeight = 68.0
		growingTextView.textContainerInset = UIEdgeInsets(top: 6,
														  left: 15,
														  bottom: 5,
														  right: 15)
		growingTextView.delegate = self
		growingTextView.layer.cornerRadius = 18
		growingTextView.layer.masksToBounds = true
		growingTextView.layer.borderWidth = 1
		growingTextView.layer.borderColor = UIColor.sweetGray.cgColor
	}
	
	private func setupTableView() {
		tableView.tableFooterView = UIView.init(frame: .zero)
		tableView.dataSource = self
	}
	
	// MARK: - Actions
	@IBAction func complate(_ sender: UIButton) {
		
	}
	
	@IBAction func medcard(_ sender: UIButton) {
		
	}
	
}

extension ConversationViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
		cell.textLabel?.text = "Привет Марха"
		return cell
	}
}

extension ConversationViewController: GrowingTextViewDelegate {
	func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
		print(height)
		textView.frame.size.height = height
		UIView.animate(withDuration: 0.2) {
			self.view.layoutIfNeeded()
		}
	}
	
	func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
		if text == "\n" {
			textView.resignFirstResponder()
			return false
		}
		return true
	}
}

extension ConversationViewController {
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
		bottomConstraint.constant = isKeyboardShowing ? keyboardFrame.height : 20
		UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
			self.view.layoutIfNeeded()
		}, completion: nil)
	}
}
