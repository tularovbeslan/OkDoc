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
    private var viewModels: [TimeViewModel] = []
    private var selectedIndex: Int = 0
    private var currentWidth: CGFloat = 0
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        addSubview(collectionView)
        configureCollectionView()
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
        collectionView.register(nibModels: [TimeViewModel.self])
        collectionView.contentInset = UIEdgeInsets.init(top: 23, left: 18, bottom: 23, right: 18)
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func createTestViewModel() {
        for element in times {
            let model = TimeViewModel(time: element)
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
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let interitemSpacing = layout.minimumInteritemSpacing
        let lineSpacing = layout.minimumLineSpacing
        let width = (collectionView.frame.width - (collectionView.contentInset.left * 2) - interitemSpacing) / 3 - 3
        let height = (collectionView.frame.height - (collectionView.contentInset.top * 2) - lineSpacing) / 3 - 3
        return CGSize(width: width, height: height)
    }
}
