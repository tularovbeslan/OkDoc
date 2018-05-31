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
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var growingTextView: GrowingTextView!
	@IBOutlet weak var timerLabel: UILabel!
	
	var messeges = ["Neverthink will be back on Monday", "You’ll get a notification when they reply", "Здравстуйте. Болит все", "Все поправимо", "You’ll get a notification when they reply", "Здравстуйте. Болит все", "Все поправимо", "You’ll get a notification when they reply", "Здравстуйте. Болит все", "Все поправимо", "You’ll get a notification when they reply", "Здравстуйте. Болит все", "Все поправимо", "You’ll get a notification when they reply", "Здравстуйте. Болит все", "Все поправимо"]

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
		automaticallyAdjustsScrollViewInsets = false
        output.viewIsReady()
		setupCollectionView()
    }
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		collectionView.collectionViewLayout.invalidateLayout()
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
	
	private func setupCollectionView() {
		collectionView.register(OutCommingCell.self, forCellWithReuseIdentifier: "cell")
		collectionView.alwaysBounceVertical = true
		collectionView.dataSource = self
		collectionView.delegate = self
	}
	
	// MARK: - Actions
	@IBAction func complate(_ sender: UIButton) {
		
	}
	
	@IBAction func medcard(_ sender: UIButton) {
		
	}
}

extension ConversationViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return messeges.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OutCommingCell
		let message = messeges[indexPath.row]
		cell.textView.text = message
		cell.bubbleWidth?.constant = estimatedFrameForText(string: message).width + 32
		return cell
	}
}

extension ConversationViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		var height: CGFloat = 80
		let text = messeges[indexPath.item]
		height = estimatedFrameForText(string: text).height + 20
		return CGSize.init(width: view.frame.width, height: height)
	}
	
	fileprivate func estimatedFrameForText(string: String) -> CGSize {
		let font = UIFont.avertaCY(style: .Semibold, size: 16)
		return NSString(string: string).boundingRect(with: CGSize(width: UIScreen.main.bounds.width * 0.6, height: 1000), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil).size
		
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
