
//
//  UICollectionViewExtension.swift
//  OmniPharm
//
//  Created by Beslan Tularov on 07.03.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit.UICollectionView

extension UICollectionView {
    func dequeueReusableCell(withModel model: AnyCellViewModel, for indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: type(of: model).anyCellType)
        let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        model.associatedInstanceOf(cell: cell)
        return cell
    }
    
    func register(nibModels: [AnyCellViewModel.Type]) {
        for model in nibModels {
            let identifier = String(describing: model.anyCellType)
            let nib = UINib(nibName: identifier, bundle: nil)
            self.register(nib, forCellWithReuseIdentifier: identifier)
        }
    }
}

