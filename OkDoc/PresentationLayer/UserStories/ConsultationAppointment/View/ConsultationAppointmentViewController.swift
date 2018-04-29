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
    private let sections: [SectionType] = [.dateSelection, .analysis, .questionnaire]
    private var viewModel: ConsultationAppointmentViewModel!
    private var dateSelectionCell: DateSelectionCell!
    private var analysisCell: AnalysisCell!
    private var questionnaireCell: QuestionnaireCell!
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }

    // MARK: ConsultationAppointmentViewInput
    func setupInitialState() {
        createStaticCells()
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
        setModels()
        reloadTableView()
    }
    
    private func reloadTableView() {
        tableView.reloadData()
    }
    
    // MARK: - Helpers
    private func createStaticCells() {
        dateSelectionCell = DateSelectionCell.fromXib()
        analysisCell = AnalysisCell.fromXib()
        analysisCell.delegate = self
        
        questionnaireCell = QuestionnaireCell.fromXib()
        questionnaireCell.questionFirst.delegate = self
        questionnaireCell.questionSecond.delegate = self
    }
    
    private func setModels() {
        dateSelectionCell.setup(viewModel: viewModel.dataSelectionViewModel)
        analysisCell.setup(viewModel: viewModel.analysisViewModels)
    }
    
    private func configureTableView() {
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
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
            return analysisCell
        case .dateSelection:
            return dateSelectionCell
        case .questionnaire:
            return questionnaireCell
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
            return UITableViewAutomaticDimension
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

extension ConsultationAppointmentViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        let pointInTable:CGPoint = textView.superview!.convert(textView.frame.origin, to: tableView)
        if let accessoryView = textView.inputAccessoryView {
            let visibleRect = CGRect.init(x: pointInTable.x, y: pointInTable.y, width: UIScreen.main.bounds.width, height: accessoryView.frame.size.height)
            tableView.scrollRectToVisible(visibleRect, animated: true)
        }
        return true
    }
}

extension ConsultationAppointmentViewController {
    private enum SectionType {
        case dateSelection
        case analysis
        case questionnaire
    }
}

