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
    var viewModels: [DoctorsViewModel] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentBar: SegmentBar!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: CategoryViewInput
    func setupInitialState() {
        configureTableView()
        testModels()
        segmentBar.titles = ["Онлайн", "По записи"]
    }
    
    func setNavigationBar(title: String) {
        self.title = title
    }
    
    // MARK: - Helpers
    func configureTableView() {
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nibModels: [DoctorsViewModel.self])
    }
    
    func testModels() {
        var titles = ["Урюмцева Елена Николаевна", "Кадышев Марат Абдуллович", "Фролова Светлана Юрьевна", "Урюмцева Елена Николаевна"]
        var experience = [10, 32, 12, 6]
        var price = [990, 1800, 1000, 850]
        var photo = ["doc1", "doc2", "doc3", "doc4"]
        for i in 0..<titles.count {
            let model = DoctorsViewModel(title: titles[i], experience: experience[i], price: price[i], language: "pусский, английский, немецкий", photo: photo[i])
            viewModels.append(model)
        }
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
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
