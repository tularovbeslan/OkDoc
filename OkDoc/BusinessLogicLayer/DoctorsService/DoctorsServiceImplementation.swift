//
//  DoctorsServiceImplementation.swift
//  OkDoc
//
//  Created by workmachine on 04.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

class DoctorsServiceImplementation: DoctorsService {
    var network: Network!
    
    func obtainDoctors(completion: @escaping ([DoctorsViewModel]) -> ()) {
        network.loadDoctors { (response) in
            completion(response)
        }
    }
}
