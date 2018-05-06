//
//  ConsultationAppointmentConsultationAppointmentViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class ConsultationAppointmentViewController: UIViewController, Delegatable, ConsultationAppointmentViewInput, TransitionHandler {

    // MARK: - Properties
    var output: ConsultationAppointmentViewOutput!
    private let sections: [SectionType] = [.dateSelection, .analysis, .questionnaire]
    private var viewModel: ConsultationAppointmentViewModel!
    private var dateSelectionCell: DateSelectionCell!
    private var analysisCell: AnalysisCell!
    private var questionnaireCell: QuestionnaireCell!
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        setKeyboardNotifications()
    }
    
    deinit {
        destroyKeyboardNotifications()
        print("deinit ConsultationAppointmentViewController")
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String.init(describing: AnalysisSelectionViewController.self) {
            let destination = segue.destination as! AnalysisSelectionViewController
            destination.completionHandler = { [weak self] model in
                self?.analysisCell.viewModels.insert(model, at: (self?.analysisCell.viewModels.count)! - 1)
                let indexPath = IndexPath(item: (self?.analysisCell.viewModels.count)! - 2, section: 0)
                let indexPaths: [IndexPath] = [indexPath]
                
                self?.analysisCell.collectionView.performBatchUpdates({
                    self?.analysisCell.collectionView.insertItems(at: indexPaths)
                }) { [weak self] (finish) in
                    UIView.setAnimationsEnabled(false)
                    self?.tableView.beginUpdates()
                    self?.tableView.endUpdates()
                    UIView.setAnimationsEnabled(true)
                }
            }
        }
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
    
    // MARK: - Helpers
    private func createStaticCells() {
        dateSelectionCell = DateSelectionCell.fromXib()
        analysisCell = AnalysisCell.fromXib()
        analysisCell.delegate = self
        questionnaireCell = QuestionnaireCell.fromXib()
        questionnaireCell.delegate = self
    }
    
    private func setModels() {
        dateSelectionCell.setup(viewModel: viewModel.dataSelectionViewModel)
        analysisCell.setup(viewModel: viewModel.analysisViewModels)
    }
    
    private func configureTableView() {
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 15, right: 0)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func reloadTableView() {
        tableView.reloadData()
    }
    
    private func setKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard(notification:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    private func destroyKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc private func handleKeyboard(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else {return}
        let isKeyboardShowing = notification.name == .UIKeyboardWillShow
        tableViewBottomConstraint.constant = isKeyboardShowing ? keyboardFrame.height : 0
        UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
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
        output.addAnalysis()
    }
}

extension ConsultationAppointmentViewController: QuestionnaireCellDelegate {
    func textViewDidChange() {
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

