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
    
    func loadAnalysis(completion: @escaping (AnalysisSelectionViewModel) -> ()) {
        
    }
    
    func loadDoctors(completion: @escaping ([DoctorsViewModel]) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            var viewModels: [DoctorsViewModel] = []

            var titles = ["Урюмцева Елена Николаевна", "Кадышев Марат Абдуллович", "Фролова Светлана Юрьевна", "Урюмцева Елена Николаевна"]
            var experience = [10, 32, 12, 6]
            var price = [990, 1800, 1000, 850]
            var photo = ["doc1", "doc2", "doc3", "doc4"]
            for i in 0..<titles.count {
                let model = DoctorsViewModel(title: titles[i], experience: experience[i], price: price[i], language: "pусский, английский, немецкий", photo: photo[i])
                viewModels.append(model)
            }
            completion(viewModels)
        }
    }
}
