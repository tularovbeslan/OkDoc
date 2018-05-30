//
//  DoctorsListDoctorsListViewController.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

final class DoctorsListViewController: UIViewController, DoctorsListViewInput, StoryboardInitializable, TransitionHandler {

    // MARK: - Properties
    var output: DoctorsListViewOutput!
    private var viewModels: [DoctorsViewModel] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentBar: SegmentBar!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
    
    // MARK: CategoryViewInput
    func setupInitialState() {
        configureTableView()
        segmentBar.createViewModel(titles: ["Онлайн", "По записи"])
        output.viewIsReady()
    }
    
    func setNavigationBar(title: String) {
        self.title = title
    }
    
    func updateView(with viewModels: [DoctorsViewModel]) {
        self.viewModels = viewModels
        reloadTableView()
    }
    
    // MARK: - Helpers
    private func configureTableView() {
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nibModels: [DoctorsViewModel.self])
    }
    
    private func reloadTableView() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension DoctorsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModels[indexPath.row]
        return tableView.dequeueReusableCell(withModel: model, for: indexPath)
    }
}

// MARK: - UITableViewDelegate
extension DoctorsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelect()
		if #available(iOS 10.0, *) {
			let generator = UISelectionFeedbackGenerator()
			generator.selectionChanged()
		}
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
