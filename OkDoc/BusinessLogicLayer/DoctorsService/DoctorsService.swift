//
//  DoctorsService.swift
//  OkDoc
//
//  Created by workmachine on 04.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

protocol DoctorsService {
    func obtainDoctors(completion: @escaping ([DoctorsViewModel])->())
}
