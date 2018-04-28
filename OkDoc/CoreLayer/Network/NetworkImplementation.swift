//
//  NetworkImplementation.swift
//  OkDoc
//
//  Created by workmachine on 22.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

class NetworkImplementation: Network {
    func loadCategories(completion: @escaping ([CategoryViewModel]) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            var viewModels: [CategoryViewModel] = []
            var titles = ["Логопед", "Физиотерапевт", "Гастроэнтеролог"]
            var subTitles = ["Нарушения структурно–семантического оформления высказывания", "Применение физических факторов с лечебной и профилактической целью", "Лечение болезней желудочно–кишечного тракта"]
            var photo = ["image1", "image2", "image3"]
            for i in 0..<titles.count {
                let model = CategoryViewModel(title: titles[i], subTitle: subTitles[i], photo: photo[i])
                viewModels.append(model)
            }
            completion(viewModels)
        }
    }
    
    func loadAppointmentInformation(completion: @escaping (ConsultationAppointmentViewModel) -> ()) {
        
        
    }
}
