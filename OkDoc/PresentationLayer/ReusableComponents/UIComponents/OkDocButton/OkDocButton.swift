//
//  OkDocButton.swift
//  OkDoc
//
//  Created by Beslan Tularov on 16.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class OkDocButton: UIControl {
    
    // MARK: - Properties
    private var titleLabel: UILabel? = {
        let label = UILabel()
        let font = UIFont(name: "AvertaCY-Semibold", size: 12) ?? UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 2
        label.textColor = .white
        label.font = font
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        return label
    }()

    private var priceLabel: UILabel? = {
        let label = UILabel()
        let font = UIFont(name: "AvertaCY-Bold", size: 23) ?? UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.font = font
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(elements: [priceLabel, titleLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.isUserInteractionEnabled = false
        return stack
    }()
    
    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.8 : 1
        }
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(touchedUpInside), for: .touchUpInside)
        configureStackViewConstraints()
    }
    
    
    deinit {
        print("deinit OkDocButton")
    }
    
    open func setTitle(text: String) {
        titleLabel?.text = text
    }
    
    open func setPrice(text: String) {
        priceLabel?.text = text
    }
    
    private func configureStackViewConstraints() {
        addSubview(stackView)
        constraints(for: stackView)
    }
    
    private func constraints(for view: UIView) {
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    @objc private func touchedUpInside() {
        self.sendActions(for: .valueChanged)
		if #available(iOS 10.0, *) {
			let generator = UIImpactFeedbackGenerator(style: .medium)
			generator.impactOccurred()
		}
    }
}

extension UIStackView {
    convenience init(elements: [UIView?]) {
        self.init()
        for element in elements {
            guard let view = element else {
                return
            }
            addArrangedSubview(view)
        }
    }
}
