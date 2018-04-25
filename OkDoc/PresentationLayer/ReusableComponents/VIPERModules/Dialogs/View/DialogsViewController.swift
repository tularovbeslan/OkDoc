//
//  DialogsDialogsViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

final class DialogsViewController: UIViewController, DialogsViewInput, StoryboardInitializable {

    // MARK: - Properties
    var output: DialogsViewOutput!
    var viewModels: [DialogsViewModel] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: - IBActions
    @IBAction func menuDidPress(_ sender: UIButton) {
        
    }
    
    // MARK: - DialogsViewInput
    func setupInitialState() {
        configureTableView()
        testModels()
    }
    
    // MARK: - Helpers
    func configureTableView() {
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(nibModels: [DialogsViewModel.self])
        tableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 15, right: 0)
    }
    
    func testModels() {
        let professional = ["Логопед", "Физиотерапевт", "Гастроэнтеролог"]
        let name = ["Урюмцева Елена Николаевна", "Кадышев Марат Абдуллович", "Фролова Светлана Юрьевна"]
        let photo = ["doc1", "doc2", "doc3"]
        let date = ["12 апреля в 10:30", "18 апреля в 12:30", "1 апреля в 00:00"]
        for i in 0..<professional.count {
            let model = DialogsViewModel(name: name[i], profession: professional[i], date: date[i], photo: photo[i])
            viewModels.append(model)
        }
        tableView.reloadData()
    }
}


// MARK: - UITableViewDataSource
extension DialogsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModels[indexPath.row]
        return tableView.dequeueReusableCell(withModel: model, for: indexPath)
    }
}

// MARK: - UITableViewDelegate
extension DialogsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
