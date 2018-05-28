//
//  RegistrationRegistrationViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 10/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, RegistrationViewInput {

    var output: RegistrationViewOutput!
	private var cells: [UITableViewCell] = []
	private var viewModels: [FormViewModel] = []
	
	// MARK: - IBOutlets
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var doneButton: UIButton!


    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: RegistrationViewInput
    func setupInitialState() {
		configureTableView()
		configureDoneButton()
		testModels()
    }
	
	// MARK: - Helpers
	private func configureTableView() {
		tableView.tableFooterView = UIView.init(frame: .zero)
		tableView.separatorStyle = .none
		tableView.delegate = self
		tableView.dataSource = self
		tableView.showsVerticalScrollIndicator = false
		tableView.register(nibModels: [FormViewModel.self])
		tableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 15, right: 0)
	}
	
	private func configureDoneButton() {
		doneButton.setTitle("Готово", for: .normal)
		doneButton.layer.cornerRadius = 14
		doneButton.backgroundColor = UIColor(red:125/255.0, green:76/255.0, blue:245/255.0, alpha: 1)
	}
	
	private func testModels() {
		
		let genderCell = GenderCell.fromXib()
		genderCell.title.text = "И последнее. Несколько слов о себе. Это очень важно"
		genderCell.selectedIndex = 1
		genderCell.verticalSpacing.constant = 20
		cells.append(genderCell)
		
		let titles = ["Возраст", "Вес, кг", "Рост, см"]
		let text = ["47", "98", "198"]
		
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
extension RegistrationViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cells.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return cells[indexPath.row]
	}
}

// MARK: - UITableViewDelegate
extension RegistrationViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}
}

extension RegistrationViewController: FormCellDelegate {
	func textViewDidChange() {
		UIView.setAnimationsEnabled(false)
		self.tableView.beginUpdates()
		self.tableView.endUpdates()
		UIView.setAnimationsEnabled(true)
	}
}
