//
//  CategoryCategoryViewController.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

final class CategoryViewController: UIViewController, CategoryViewInput, TransitionHandler, StoryboardInitializable {

    // MARK: - Properties
    var output: CategoryViewOutput!
    private var viewModels: [CategoryViewModel] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var segmentBar: SegmentBar!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }

    // MARK: - CategoryViewInput
    func setupInitialState() {
		segmentBar.createViewModel(titles: ["Взрослые", "Дети"])
        configureTableView()
        output.viewIsReady()
    }
    
    func updateView(with viewModels: [CategoryViewModel]) {
        self.viewModels = viewModels
        reloadView()
    }
    
    // MARK: - Helpers
    private func configureTableView() {
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(nibModels: [CategoryViewModel.self])
        tableView.contentInset = UIEdgeInsets.init(top: 15, left: 0, bottom: 15, right: 0)
    }
    
    private func reloadView() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModels[indexPath.row]
        return tableView.dequeueReusableCell(withModel: model, for: indexPath)
    }
}

// MARK: - UITableViewDelegate
extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelect()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
