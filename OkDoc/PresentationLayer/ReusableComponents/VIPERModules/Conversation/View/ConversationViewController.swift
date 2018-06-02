//
//  ConversationConversationViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 27/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit
import GrowingTextView
import AsyncDisplayKit
import GBDeviceInfo
import RealmSwift

class ConversationViewController: UIViewController, ConversationViewInput {

    var output: ConversationViewOutput!
	var tableNode = ASTableNode()
	var deviceInfo = GBDeviceInfo.deviceInfo()
	var messeges: Results<Message>!
	var token: NotificationToken? = nil
	let realManager = RealmManager()
	
	@IBOutlet weak var bottomConstraint: NSLayoutConstraint!
	@IBOutlet weak var growingTextView: GrowingTextView!
	@IBOutlet weak var timerLabel: UILabel!
	@IBOutlet weak var containerView: UIView!
	
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
		view.addSubnode(tableNode)
		automaticallyAdjustsScrollViewInsets = false
        output.viewIsReady()
		setupCollectionView()
		messeges = realManager.realm.objects(Message.self).sorted(byKeyPath: "date", ascending: true)
		token = messeges.observe { changes in
			switch changes {
			case .initial:
				self.tableNode.reloadData()
			case .update(_, let deletions, let insertions, let modifications):
				self.tableNode.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .none)
				self.tableNode.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }), with: .none)
				self.tableNode.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0) }), with: .none)
			case .error(let error):
				self.realManager.post(error)
				()
			}
		}
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if deviceInfo?.model == GBDeviceModel.modeliPhoneX {
			tableNode.view.frame = CGRect.init(x: 0, y: 102, width: view.frame.width, height: (view.frame.height - 84) - 102)

		} else {
			tableNode.view.frame = CGRect.init(x: 0, y: 64, width: view.frame.width, height: (view.frame.height - 50) - 64)

		}
		tableNode.view.separatorStyle = .none
		//tableNode.inverted = true
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
		tableNode.dataSource = self
		tableNode.delegate = self
	}
	
	private func uploadImage(image: UIImage) {
		
	}
	
	private func sendMessage(text: String) {
		let message = Message.init(text: text, imageData: nil, date: Date())
		output.send(object: message)
		growingTextView.text = nil
		DispatchQueue.main.async {
			self.tableNode.scrollToRow(at: IndexPath.init(row: self.messeges.count - 1, section: 0), at: .bottom, animated: true)
		}
	}
	
	// MARK: - Actions
	@IBAction func complate(_ sender: UIButton) {
		
	}
	
	@IBAction func medcard(_ sender: UIButton) {
		
	}
	
	@IBAction func send(_ sender: UIButton) {
		let text = growingTextView.text
		if text != "" && text != " " && text != nil {
			sendMessage(text: text!)
		}
	}
	
	@IBAction func loadImage(_ sender: UIButton) {
		let imagePickerController = UIImagePickerController()
		imagePickerController.delegate = self
		present(imagePickerController, animated: true, completion: nil)
	}
}

extension ConversationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		var selectedImage: UIImage?
		if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
			selectedImage = editedImage
		} else if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
			selectedImage = originalImage
		}
		
		guard let image = selectedImage else { return }
		uploadImage(image: image)
		dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion:  nil)
	}
}

extension ConversationViewController: ASTableDataSource {
	func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
		return messeges.count
	}
	
	func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
		let message = messeges[indexPath.row]
		let threadSafeReference = ThreadSafeReference(to: message)

		return {
			let node = InCommingDefaultCell.init(threadSafeReference: threadSafeReference)
//			if indexPath.row == 0 {
//				node.imageNode.image = #imageLiteral(resourceName: "doc4")
//			} else if indexPath.row == 2 {
//				node.imageNode.image = #imageLiteral(resourceName: "image1")
//			} else {
//				node.imageNode.image = #imageLiteral(resourceName: "butterfly")
//			}
			
			return node
		}
	}
}

extension ConversationViewController: ASTableDelegate {
	func shouldBatchFetchForCollectionNode(collectionNode: ASCollectionNode) -> Bool {
		return true
	}
}

extension ConversationViewController: GrowingTextViewDelegate {
	func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
		textView.frame.size.height = height
		UIView.animate(withDuration: 0.2) {
			self.view.layoutIfNeeded()
		}
	}
	
	func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
		if text == "\n" {
			if text != "" && text != " " && text != "\n" {
				sendMessage(text: text)
			}
			textView.resignFirstResponder()
			return false
		}
		return true
	}
	
	func textViewDidBeginEditing(_ textView: UITextView) {
		tableNode.scrollToRow(at: IndexPath.init(row: messeges.count - 1, section: 0), at: .bottom, animated: true)
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
		bottomConstraint.constant = isKeyboardShowing ? keyboardFrame.height : 0
		UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
			self.view.layoutIfNeeded()
			self.tableNode.frame = self.containerView.frame

		}, completion: nil)
	}
}
