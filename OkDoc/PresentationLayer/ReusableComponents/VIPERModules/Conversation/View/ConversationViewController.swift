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
import RealmSwift
import SnapKit
import MobileCoreServices
import AVFoundation

final class ConversationViewController: UIViewController, ConversationViewInput, StoryboardInitializable {

    var output: ConversationViewOutput!
	var recorder: AVAudioRecorder!
	var metters = [Float]()
	var meterTimer: Timer!
	var audioFileURL: URL!
	var fileName: String = ""
	var tableNode = ASTableNode()
	var messeges: Results<Message>!
	var token: NotificationToken? = nil
	let realManager = RealmManager()
	var consultationTimer: Timer!
	var consultationTime = 1800
	var emptyView = UIView()
	
	@IBOutlet weak var inputHeightConstraint: NSLayoutConstraint!
	@IBOutlet weak var bottomConstraint: NSLayoutConstraint!
	@IBOutlet weak var timerLabel: UILabel!
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var inputTextView: UIView!
	@IBOutlet weak var sendButton: UIButton!
	@IBOutlet weak var growingTextView: GrowingTextView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
		consultationTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
		
		directoryPath(path: Directory.Videos.rawValue)
		directoryPath(path: Directory.Audios.rawValue)
		containerView.addSubnode(tableNode)
		automaticallyAdjustsScrollViewInsets = false
        output.viewIsReady()
		setupTableNode()
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
			}
		}
		setupEmptyView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		self.tableNode.scrollToRow(at: IndexPath.init(row: self.messeges.count - 1, section: 0), at: .bottom, animated: false)
		emptyView.removeFromSuperview()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.navigationController?.setNavigationBarHidden(false, animated: animated)
	}
	
	deinit {
		consultationTimer.invalidate()
		destroyKeyboardNotifications()
		print("ConversationViewController deinit")
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
		growingTextView.maxHeight = 150.0
		growingTextView.textContainerInset = UIEdgeInsets(top: 7,
														  left: 15,
														  bottom: 7,
														  right: 15)
		growingTextView.delegate = self
		growingTextView.layer.cornerRadius = 18
		growingTextView.layer.masksToBounds = true
		growingTextView.layer.borderWidth = 1
		growingTextView.layer.borderColor = UIColor.sweetGray.cgColor
	}
	
	private func setupTableNode() {
		tableNode.view.snp.makeConstraints { (make) in
			make.top.left.right.bottom.equalToSuperview()
		}
		tableNode.view.separatorStyle = .none
		tableNode.dataSource = self
		tableNode.delegate = self
	}
	
	func setupEmptyView() {
		containerView.addSubview(emptyView)
		emptyView.backgroundColor = .white
		emptyView.snp.makeConstraints { (make) in
			make.left.top.right.bottom.equalToSuperview()
		}
	}
	
	@objc private func timerUpdate() {
		consultationTime -= 1
		let currentTime = Int(consultationTime)
		let minutes = currentTime / 60
		let seconds = currentTime - minutes * 60
		timerLabel.text = String.init(format: "%.2d:%.2d", minutes, seconds)
	}
	
	private func uploadVideo(urlString: String) {
		let message = Message.init(text: "", imageData: nil, videoURL: urlString, audioURL: "", metters: List<Float>(), date: Date(), incomming: false)
		output.send(object: message)
		scrollToLastRow(animeted: true)
	}
	
	private func uploadImage(image: UIImage) {
		let message = Message.init(text: "", imageData: image.data(), videoURL: "", audioURL: "", metters: List<Float>(), date: Date(), incomming: false)
		output.send(object: message)
		scrollToLastRow(animeted: true)
	}
	
	func sendAudio(urlString: String) {
		let list = List<Float>()
		metters.forEach { (metter) in
			list.append(metter)
		}
		
		let message = Message.init(text: "", imageData: nil, videoURL: "", audioURL: urlString, metters: list, date: Date(), incomming: false)
		output.send(object: message)
		scrollToLastRow(animeted: true)
	}
	
	private func sendMessage(text: String) {
		let message = Message.init(text: text, imageData: nil, videoURL: "", audioURL: "", metters: List<Float>(), date: Date(), incomming: true)
		output.send(object: message)
		growingTextView.text = nil
		scrollToLastRow(animeted: true)
	}
	
	fileprivate func scrollToLastRow(animeted: Bool) {
		DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
			self.tableNode.scrollToRow(at: IndexPath.init(row: self.messeges.count - 1, section: 0), at: .bottom, animated: animeted)
		}
	}
	
	fileprivate func scrollToBottom(animated: Bool) {
		var yOffset: CGFloat = 0.0
		if tableNode.view.contentSize.height > tableNode.view.bounds.size.height {
			yOffset = tableNode.view.contentSize.height - tableNode.view.bounds.size.height
		}
		self.tableNode.setContentOffset(CGPoint.init(x: 0, y: yOffset), animated: animated)
	}
	
	fileprivate func directoryPath(path: String) {
		FileStorageManager.createPath(path: path)
	}
	
	// MARK: - Actions
	@IBAction func complate(_ sender: UIButton) {
		navigationController?.popViewController(animated: true)
	}
	
	@IBAction func medcard(_ sender: UIButton) {
		
	}
	
	@IBAction func send(_ sender: UIButton) {
		let image = sender.image(for: .normal)
		if image == #imageLiteral(resourceName: "send") {
			let text = growingTextView.text
			if text != "" && text != " " && text != nil {
				sendMessage(text: text!)
				sender.setImage(#imageLiteral(resourceName: "record"), for: .normal)
			}
		} else if image == #imageLiteral(resourceName: "record") {
			sender.setImage(#imageLiteral(resourceName: "stop"), for: .normal)
			startRecord()
		} else {
			sender.setImage(#imageLiteral(resourceName: "record"), for: .normal)
			stopRecording()
		}
		
	}
	
	@IBAction func loadImage(_ sender: UIButton) {
		let imagePickerController = UIImagePickerController()
		imagePickerController.delegate = self
		imagePickerController.mediaTypes = [kUTTypeImage, kUTTypeMovie] as [String]
		present(imagePickerController, animated: true, completion: nil)
	}
}

extension ConversationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		if let videoURL = info[UIImagePickerControllerMediaURL] as?  URL {
			handleSelectVideoForURL(url: videoURL)
		} else {
			handleSelectImageForInfo(info: info)
		}
		
		dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion:  nil)
	}
	
	private func handleSelectVideoForURL(url: URL) {
		FileStorageManager.saveFileby(type: .mp4, directory: .Videos, url: url) { (complated, error, path) in
			if complated {
				DispatchQueue.main.async {
					self.uploadVideo(urlString: path)
				}
			}
		}
	}
	
	private func handleSelectImageForInfo(info: [String: Any]) {
		var selectedImage: UIImage?
		if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
			selectedImage = editedImage
		} else if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
			selectedImage = originalImage
		}
		guard let image = selectedImage else { return }
		uploadImage(image: image)
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
			let node = BubbleBuilder(threadSafeReference: threadSafeReference).build()
			return node
		}
	}
	
	func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
		
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

		DispatchQueue.main.async {
			self.tableNode.scrollToRow(at: IndexPath.init(row: self.messeges.count - 1, section: 0),
									   at: .bottom, animated: false)
		}
	}
	
	func textViewDidChange(_ textView: UITextView) {
		if textView.text != "" {
			sendButton.setImage(#imageLiteral(resourceName: "send"), for: .normal)
		} else {
			sendButton.setImage(#imageLiteral(resourceName: "record"), for: .normal)
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
}

extension ConversationViewController {
	private func setKeyboardNotifications() {
		NotificationCenter.default.addObserver(self,
											   selector: #selector(handleKeyboard(notification:)),
											   name: .UIKeyboardWillShow,
											   object: nil)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(handleKeyboard(notification:)),
											   name: .UIKeyboardWillHide,
											   object: nil)
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
		inputHeightConstraint.constant = isKeyboardShowing ? 50 : 70

		UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
			self.view.layoutIfNeeded()
		}, completion: nil)
		
		scrollToBottom(animated: false)
		
	}
}
