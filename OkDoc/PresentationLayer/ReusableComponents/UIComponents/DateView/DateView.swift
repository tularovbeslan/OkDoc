//
//  DateView.swift
//  OkDoc
//
//  Created by workmachine on 22.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class DateView: UIView {
    // MARK: - Properties
    var date: [[String: String]] = [[:]] {
        didSet {
            createTestViewModel()
            configureCollectionView()
            let indexPath = IndexPath.init(item: 0, section: 0)
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
        }
    }
    private var viewModels: [DateViewModel] = []
    private var selectedIndex: Int = 0
    private var horizontalBarLeftConstraint: NSLayoutConstraint?
    private var horizontalBarWidthConstraint: NSLayoutConstraint?
    private lazy var horizontalBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:2/255.0, green:123/255.0, blue:255/255.0, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    // MARK: Life cycle
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
    
    deinit {
        print("deinit DateView")
    }
    
    // MARK: - Helpers
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(nibModels: [DateViewModel.self])
        collectionView.contentInset = UIEdgeInsets.init(top: 5, left: 18, bottom: 5, right: 18)
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.performBatchUpdates(nil, completion: { [weak self] (result) in
            self?.setupHorizontalBarView()
        })
    }
    
    private func createTestViewModel() {
        for element in date {
            for (key, value) in element {
                let model = DateViewModel.init(weekDay: key, date: value)
                viewModels.append(model)
            }
        }
        collectionView.reloadData()
    }
    
    private func setupHorizontalBarView() {
        addSubview(horizontalBarView)
        let indexPath = IndexPath.init(item: 0, section: 0)
        let cell = collectionView.cellForItem(at: indexPath) as! DateCell
        horizontalBarLeftConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: collectionView.contentInset.left + cell.stackView.frame.origin.x)
        horizontalBarLeftConstraint?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        horizontalBarWidthConstraint = horizontalBarView.widthAnchor.constraint(equalToConstant: sizeOfString(string: viewModels[selectedIndex].date, constrainedToHeight: 2).width)
        horizontalBarWidthConstraint?.isActive = true
    }
    
    private func configureHorizontalBarPositionBy(cell: DateCell) {
        let width = cell.convert(cell.date.frame, to: self).size.width
        let xOffset = cell.convert(cell.date.frame, to: self).origin.x + cell.stackView.frame.origin.x
        horizontalBarWidthConstraint?.constant = width
        horizontalBarLeftConstraint?.constant = xOffset
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    private func sizeOfString(string: String, constrainedToHeight height: Double) -> CGSize {
        let font = UIFont(name: "AvertaCY-Semibold", size: 20) ?? UIFont.systemFont(ofSize: 20)
        return NSString(string: string).boundingRect(with: CGSize(width: .greatestFiniteMagnitude, height: height), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil).size
    }
}

// MARK: - UICollectionViewDataSource
extension DateView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = viewModels[indexPath.item]
        return collectionView.dequeueReusableCell(withModel: model, for: indexPath)
    }
}

extension DateView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! DateCell
        configureHorizontalBarPositionBy(cell: cell)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DateView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let interitemSpacing = layout.minimumInteritemSpacing
        let width = (UIScreen.main.bounds.width - (collectionView.contentInset.left * 2) - interitemSpacing) / CGFloat(date.count) - 7
        let height = collectionView.frame.height - (collectionView.contentInset.top * 2)
        return CGSize(width: width, height: height)
    }
}

extension DateView: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let velocity = scrollView.panGestureRecognizer.velocity(in: collectionView).x
//        if velocity > 0 {
//            print(scrollView.contentOffset.x / 100)
//            horizontalBarLeftConstraint?.constant += (scrollView.contentOffset.x / 100)
//        } else if velocity < 0 {
//            print(scrollView.contentOffset.x / 100)
//
//            horizontalBarLeftConstraint?.constant += (scrollView.contentOffset.x / 100)
//        }
//    }
}
