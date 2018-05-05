//
//  AppAppearance.swift
//  OkDoc
//
//  Created by workmachine on 23.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

enum AppAppearance {
    case Color (Components)
    case Fount (Components)
}

enum Components {
    case UserStories (UserStory)
    case ReusableComponents
    case Cells
}

enum UserStory {
    case DoctorDetail
    case CategorySelection
    case ConsultationAppointment
    case Consultation
}
