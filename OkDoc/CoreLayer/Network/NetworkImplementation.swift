//
//  NetworkImplementation.swift
//  OkDoc
//
//  Created by workmachine on 22.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation
import Alamofire

class NetworkImplementation: Network {
	
	let base = "http://85.143.174.124:8002"
	
    func loadCategories(completion: @escaping ([CategoryViewModel]) -> ()) {
		let headers: HTTPHeaders = [ "Authorization": "Basic ZG9jdG9yQHRlc3QuY29tOnNlY3JldA=="]
		var viewModels: [CategoryViewModel] = []
		Alamofire.request(self.base + "/api/categories", headers: headers).responseData(completionHandler: { (response) in
			let decoder = JSONDecoder()
			do {
				let results = try decoder.decode([Category].self, from: response.data!)
				for i in 0..<results.count {
					let model = CategoryViewModel(title: results[i].name, subTitle: nil, photo: nil)
					viewModels.append(model)
				}
				completion(viewModels)
				
				print(results)
			} catch let error {
				print(error)
				completion(viewModels)
			}
		})
		
		
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
