//
//  OutCommingCell.swift
//  OkDoc
//
//  Created by workmachine on 31.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class OutCommingCell: UICollectionViewCell {
	
	let bubleView: UIView = {
		let view = UIView.init(frame: .zero)
		view.backgroundColor = UIColor.inCommingBlue
		view.layer.cornerRadius = 12
		view.layer.masksToBounds = true
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let textView: UITextView = {
		let textView = UITextView.init(frame: .zero)
		textView.font = UIFont.avertaCY(style: .Regular, size: 16)
		textView.textColor = .white
		textView.backgroundColor = .clear
		textView.isEditable = false
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	var bubbleWidth: NSLayoutConstraint?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(bubleView)
		bubleView.addSubview(textView)
		setupConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
	}

	private func setupConstraints() {
		bubleView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
		bubbleWidth = bubleView.widthAnchor.constraint(equalToConstant: 200)
		bubbleWidth?.isActive = true
		bubleView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
		bubleView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		
		textView.topAnchor.constraint(equalTo: bubleView.topAnchor).isActive = true
		textView.leftAnchor.constraint(equalTo: bubleView.leftAnchor,
									   constant: 8).isActive = true
		textView.rightAnchor.constraint(equalTo: bubleView.rightAnchor,
										constant: -8).isActive = true
		textView.bottomAnchor.constraint(equalTo: bubleView.bottomAnchor).isActive = true
	}
}
