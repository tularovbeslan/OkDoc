//
//  CellViewModelProtocols.swift
//  OmniPharm
//
//  Created by Beslan Tularov on 07.03.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

protocol AnyCellViewModel {
    static var anyCellType: UIView.Type { get }
    func associatedInstanceOf(cell: UIView)
}

protocol CellViewModel: AnyCellViewModel {
    associatedtype CellType: UIView
    func instanceOf(cell: CellType)
}

extension CellViewModel {
    static var anyCellType: UIView.Type {
        return CellType.self
    }

    func associatedInstanceOf(cell: UIView) {
        instanceOf(cell: cell as! CellType)
    }
}
