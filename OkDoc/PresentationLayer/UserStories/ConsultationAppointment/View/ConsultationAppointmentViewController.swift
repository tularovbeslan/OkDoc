//
//  ConsultationAppointmentConsultationAppointmentViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class ConsultationAppointmentViewController: UIViewController, Delegatable, ConsultationAppointmentViewInput {

    // MARK: - Properties
    var output: ConsultationAppointmentViewOutput!
    private let sections: [SectionType] = [.dateSelection, .analysis]
    private var viewModel: ConsultationAppointmentViewModel!
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }

    // MARK: ConsultationAppointmentViewInput
    func setupInitialState() {
        configureTableView()
        output.viewIsReady()
    }
    
    func setTitle(text: String) {
        title = text
    }
    
    func setNavigationBarBackButton(title: String) {
        navigationItem.leftBarButtonItem?.title = title
    }
    
    func updateView(with viewModel: ConsultationAppointmentViewModel) {
        self.viewModel = viewModel
        reloadTableView()
    }
    
    private func reloadTableView() {
        tableView.reloadData()
    }
    
    // MARK: - Helpers
    private func configureTableView() {
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nibModels: [DataSelectionViewModel.self, AnalysisViewModel.self])
    }
}

extension ConsultationAppointmentViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = sections[indexPath.section]
        switch type {
        case .analysis:
            let model = viewModel.analysisViewModels
            return tableView.dequeueReusableCell(withModel: model, for: indexPath)
        case .dateSelection:
            let model = viewModel.dataSelectionViewModel
            return tableView.dequeueReusableCell(withModel: model, for: indexPath)
        case .questionnaire:
            return tableView.dequeueReusableCell(withModel: viewModel as! AnyCellViewModel, for: indexPath)
        }
    }
}

extension ConsultationAppointmentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = sections[indexPath.section]
        switch type {
        case .analysis:
            return UITableViewAutomaticDimension
        case .dateSelection:
            return 264
        case .questionnaire:
            return 250
        }
    }
}

extension ConsultationAppointmentViewController: AnalysisCellDelegate {
    func appendNewAnalysis() {
        UIView.setAnimationsEnabled(false)
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
    }
}

extension ConsultationAppointmentViewController {
    private enum SectionType {
        case dateSelection
        case analysis
        case questionnaire
    }
}

extension UITableView {
    func setOffsetToBottom(animated: Bool) {
        self.setContentOffset(CGPoint.init(x: 0, y: self.contentSize.height - self.frame.size.height), animated: true)
    }
    
    func scrollToLastRow(animated: Bool) {
        if self.numberOfRows(inSection: 0) > 0 {
            self.scrollToRow(at: IndexPath(row: self.numberOfRows(inSection: 0) - 1, section: 0) as IndexPath, at: .bottom, animated: animated)
        }
    }
}
