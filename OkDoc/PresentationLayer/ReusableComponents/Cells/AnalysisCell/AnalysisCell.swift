//
//  AnalysisCell.swift
//  OkDoc
//
//  Created by workmachine on 26.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

protocol AnalysisCellDelegate: class {
    func appendNewAnalysis()
}

final class AnalysisCell: UITableViewCell, XibInitializable {
    
    // MARK: - Properties
    weak var delegate: AnalysisCellDelegate?
    private var viewModels: [AnalysisDataViewModel] = []
    private var itemWidth: CGFloat!
    private var itemHeight: CGFloat!
    
    // MARK: - IBOutlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        let grayColor = UIColor.init(red: 159/255, green: 171/255, blue: 185/255, alpha: 1)
        setSubTitle(color: grayColor)
        configureCollectionView()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        var size = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
        collectionView.layoutIfNeeded()
        size.height = collectionView.contentSize.height + title.frame.height + subTitle.frame.height + 10
        return size
    }
    
    // MARK: - Helpers
    private func setSubTitle(color: UIColor) {
        subTitle.textColor = color
    }
    
    private func configureCollectionView() {
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(nibModels: [AnalysisDataViewModel.self])
        collectionView.contentInset = UIEdgeInsets.init(top: 10, left: 18, bottom: 10, right: 18)
        itemWidth = collectionView.frame.width * 0.37
        itemHeight = (itemWidth * 1.60)
    }

}

// MARK: - UICollectionViewDataSource
extension AnalysisCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = viewModels[indexPath.item]
        return collectionView.dequeueReusableCell(withModel: model, for: indexPath)
    }
}

extension AnalysisCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == viewModels.count - 1 {
            let newComment = AnalysisDataViewModel.init(image: "image2", title: "Новый анализ")
            viewModels.insert(newComment, at: viewModels.count - 1)
            
            let indexPath = IndexPath(item: viewModels.count - 2, section: 0)
            let indexPaths: [IndexPath] = [indexPath]
            
            collectionView.performBatchUpdates({
                collectionView.insertItems(at: indexPaths)
            }) { [weak self] (finish) in
                self?.delegate?.appendNewAnalysis()
            }
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AnalysisCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (((collectionView.frame.width / 2) - itemWidth) - (collectionView.contentInset.left * 2)) - 2
    }
}

extension AnalysisCell {
    func setup(viewModel: AnalysisViewModel) {
        self.viewModels = viewModel.viewModels
    }
}

