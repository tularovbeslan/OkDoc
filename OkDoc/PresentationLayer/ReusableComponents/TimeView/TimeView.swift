//
//  TimeView.swift
//  OkDoc
//
//  Created by workmachine on 22.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class TimeView: UIView {
    // MARK: - Properties
    var times: [String] = [] {
        didSet {
            createTestViewModel()
            let indexPath = IndexPath.init(item: 0, section: 0)
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
        }
    }
    private var viewModels: [SegmentViewModel] = []
    private var selectedIndex: Int = 0
    private var currentWidth: CGFloat = 0
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 100, height: 40)
        layout.minimumInteritemSpacing = 20
        let cv = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        addSubview(collectionView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Helpers
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(nibModels: [SegmentViewModel.self])
//        collectionView.contentInset = UIEdgeInsets.init(top: 0, left: 18, bottom: 0, right: 18)
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func createTestViewModel() {
        for element in times {
            let model = SegmentViewModel(title: element)
            viewModels.append(model)
        }
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension TimeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = viewModels[indexPath.item]
        return collectionView.dequeueReusableCell(withModel: model, for: indexPath)
    }
}

extension TimeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TimeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 3
        return CGSize(width: width, height: self.frame.height)
    }
}
