//
//  DrProfileDrProfileViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 10/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

final class DrProfileViewController: UIViewController, DrProfileViewInput,StoryboardInitializable {

    var output: DrProfileViewOutput!
	
	private var viewModels: [AnyCellViewModel] = []
	private var cells: [UITableViewCell] = []
	
	// MARK: - IBOutlets
	@IBOutlet weak var tableView: UITableView!
	
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
		title = "Профиль"
    }

    // MARK: DrProfileViewInput
    func setupInitialState() {
		configureTableView()
		testModels()
    }
	
	// MARK: - Helpers
	private func configureTableView() {
		tableView.tableFooterView = UIView.init(frame: .zero)
		tableView.separatorStyle = .singleLine
		tableView.delegate = self
		tableView.dataSource = self
		tableView.showsVerticalScrollIndicator = false
		tableView.register(nibModels: [FormViewModel.self])
		tableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 15, right: 0)
	}
	
	private func testModels() {
		let userInfoViewModel = UserInfoViewModel.init(title: "Урюмцева Елена Николаевна", image: "")
		let userInfoCell = UserInfoCell.fromXib()
		userInfoCell.setup(viewModel: userInfoViewModel)
		cells.append(userInfoCell)
		
		
		let stateableViewModel = StateableViewModel.init(title: "Режим работы", state: "Онлайн")
		let stateableCell = StateableCell.fromXib()
		stateableCell.setup(viewModel: stateableViewModel)
		cells.append(stateableCell)
		
		let titles = ["Личные данные", "Биография", "График работы"]
		for (index, _) in titles.enumerated() {
			let viewModel = DisclosureViewModel.init(title: titles[index])
			viewModels.append(viewModel)
			let cell = DisclosureCell.fromXib()
			cell.setup(viewModel: viewModel)
			cells.append(cell)
		}
		
		let exitCell = ExitCell.fromXib()
		exitCell.mode = .left
		cells.append(exitCell)
	
		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
extension DrProfileViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cells.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return cells[indexPath.row]
	}
}

// MARK: - UITableViewDelegate
extension DrProfileViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0 {
			return 158
		}
		return 60
	}
}
