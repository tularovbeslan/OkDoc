//
//  DoctorsListDoctorsListInteractor.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class DoctorsListInteractor: DoctorsListInteractorInput {

    weak var output: DoctorsListInteractorOutput!
    var service: DoctorsService!

    func prepareDoctors() {
        service.obtainDoctors { [weak self] (viewModel) in
            self?.output.doctorsDidPrepare(by: viewModel)
        }
    }
}
