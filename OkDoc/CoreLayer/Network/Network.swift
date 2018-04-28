//
//  Network.swift
//  OkDoc
//
//  Created by workmachine on 22.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

protocol Network {
    func loadCategories(completion: @escaping ([CategoryViewModel])->())
    func loadAppointmentInformation(completion: @escaping (ConsultationAppointmentViewModel)->())
}
