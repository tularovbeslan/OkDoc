//
//  ConsultationAppointmentConsultationAppointmentInteractor.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class ConsultationAppointmentInteractor: ConsultationAppointmentInteractorInput {

    weak var output: ConsultationAppointmentInteractorOutput!
    var service: AppointmentService!
    func prepareAppointmentInformation() {
        let times = ["9:00", "9:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00"]
        let date = [["Пн":"12"], ["Вт":"13"], ["Ср":"14"], ["Чт":"15"], ["Пт":"16"], ["Сб":"17"]]
        let dataSelectionModel = DataSelectionViewModel.init(timeModels: times, dateModels: date)
        
        let analysisEmptyModel = AnalysisDataViewModel.init(image: nil, title: "")
        
        let analysisModel = AnalysisViewModel.init(viewModels: [analysisEmptyModel])
        
        let consultationAppointmentViewModel = ConsultationAppointmentViewModel.init(dataSelectionViewModel: dataSelectionModel, analysisViewModels: analysisModel)
        
        output.AppointmentInformationDidPrepare(viewModel: consultationAppointmentViewModel)
    }
}
