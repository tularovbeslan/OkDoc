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
    var viewModels: [CategoryViewModel] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: CategoryViewInput
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
        tableView.register(nibModels: [CategoryViewModel.self])
        tableView.contentInset = UIEdgeInsets.init(top: 20, left: 0, bottom: 15, right: 0)
    }
    
    func testModels() {
        var titles = ["Логопед", "Физиотерапевт", "Гастроэнтеролог"]
        var subTitles = ["Нарушения структурно–семантического оформления высказывания", "Применение физических факторов с лечебной и профилактической целью", "Лечение болезней желудочно–кишечного тракта"]
        var photo = ["image1", "image2", "image3"]
        for i in 0..<titles.count {
            let model = CategoryViewModel(title: titles[i], subTitle: subTitles[i], photo: photo[i])
            viewModels.append(model)
        }
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
