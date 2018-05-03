//
//  ProfileProfileViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 02/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController, ProfileViewInput, StoryboardInitializable {
    // MARK: - Properties
    typealias model = FormViewModel
    var output: ProfileViewOutput!
    var viewModels: [model] = []
    var cells: [FormCell] = []

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
    
    // MARK: - DialogsViewInput
    func setupInitialState() {
        configureTableView()
        testModels()
    }
    
    func setTitle(text: String) {
        self.title = text
    }
    
    // MARK: - Helpers
    func configureTableView() {
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(nibModels: [FormViewModel.self])
        tableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 15, right: 0)
    }
    
    func testModels() {
        let titles = ["Как к Вам обращаться?", "Пол", "Возраст", "Вес, кг", "Рост, см"]
        let text = ["Анонимно", "Женский", "47", "98", "198"]
        
        for (index, _) in titles.enumerated() {
            let viewModel = FormViewModel.init(title: titles[index], text: text[index])
            viewModels.append(viewModel)
            let cell = FormCell.fromXib()
            cell.setup(viewModel: viewModel)
            cell.delegate = self
            cells.append(cell)
        }
        
        tableView.reloadData()
    }
}


// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
}

// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension ProfileViewController: FormCellDelegate {
    func textViewDidChange() {
        UIView.setAnimationsEnabled(false)
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
    }
}
