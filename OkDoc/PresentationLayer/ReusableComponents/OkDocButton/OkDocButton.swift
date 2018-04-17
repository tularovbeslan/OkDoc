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
    var titleLabel: UILabel? = {
        let label = UILabel()
        let font = UIFont(name: "AvertaCY-Semibold", size: 12) ?? UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 2
        label.textColor = .white
        label.font = font
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var priceLabel: UILabel? = {
        let label = UILabel()
        let font = UIFont(name: "AvertaCY-Bold", size: 23) ?? UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.font = font
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(elements: [priceLabel, titleLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()
    
    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = .black
        }
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        configureStackViewConstraints()
    }
    
    open func setTitle(text: String) {
        titleLabel?.text = text
    }
    
    open func setPrice(text: String) {
        priceLabel?.text = text
    }
    
    func configureStackViewConstraints() {
        addSubview(stackView)
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
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
