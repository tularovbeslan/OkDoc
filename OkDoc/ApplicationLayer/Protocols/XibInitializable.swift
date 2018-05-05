//
//  XibInitializable.swift
//  Scout
//
//  Created by BESLAN TULAROV on 01.06.17.
//  Copyright © 2017 InStat. All rights reserved.
//

import UIKit

protocol XibInitializable {
    static var name: String { get }
    static var bundle: Bundle? { get }
    
    static func fromXib() -> Self
}

extension XibInitializable where Self : UIView {
    static var name: String {
        return String(describing: Self.self)
    }
    
    static var bundle: Bundle? {
        return nil
    }
    
    static func fromXib() -> Self {
        return UINib(nibName: name, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as! Self
    }
}


