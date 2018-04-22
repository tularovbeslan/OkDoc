//
//  CategoriesServiceImplementation.swift
//  OkDoc
//
//  Created by workmachine on 22.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

class CategoriesServiceImplementation: CategoriesService {
    var network: Network!
    
    func obtainCategories(completion: @escaping ([CategoryViewModel]) -> ()) {
        network.loadCategories { (viewModels) in
            completion(viewModels)
        }
    }
}
