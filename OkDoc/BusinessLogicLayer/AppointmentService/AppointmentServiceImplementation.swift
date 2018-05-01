//
//  AppointmentServiceImplementation.swift
//  OkDoc
//
//  Created by workmachine on 27.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

class AppointmentServiceImplementation: AppointmentService {
    // MARK: - Properties
    var network: Network!
    
    // MARK: - AppointmentService
    func obtainAppointmentInformation(completion: @escaping (ConsultationAppointmentViewModel) -> ()) {
        network.loadAppointmentInformation { (consultationAppointmentViewModel) in
            completion(consultationAppointmentViewModel)
        }
    }
}
