//
//  AnalysisSelectionAnalysisSelectionViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 30/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class AnalysisSelectionViewController: UIViewController, UINavigationControllerDelegate, AnalysisSelectionViewInput, TransitionHandler {

    // MARK: - Properties
    typealias model = AnalysisSelectionViewModel
    var completionHandler:((AnalysisDataViewModel) -> Void)?
    var output: AnalysisSelectionViewOutput!
    private var text: String = ""
    private var viewModels: [model] = []
    private var filteredViewModels: [model] = []
    private let searchController = UISearchController(searchResultsController: nil)

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }

    // MARK: AnalysisSelectionViewInput
    func setupInitialState() {
        configureTableView()
        configureSearchController()
        output.viewIsReady()
    }
    
    func setNavigationBar(title: String) {
        self.title = title
    }
    
    func updateView(with viewModels: [AnalysisSelectionViewModel]) {
        self.viewModels = viewModels
        reloadTableView()
    }
    
    // MARK: - Helpers
    private func configureTableView() {
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(nibModels: [model.self])
    }
    
    private func configureSearchController() {
        searchController.searchBar.sizeToFit()
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Поиск"
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            self.tableView.tableHeaderView = self.searchController.searchBar
        }
        definesPresentationContext = true
    }
    
    private func reloadTableView() {
        tableView.reloadData()
    }
    
    private func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredViewModels = viewModels.filter({( candy : model) -> Bool in
            return candy.name.lowercased().contains(searchText.lowercased())
        })
        reloadTableView()
    }
    
    private func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension AnalysisSelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredViewModels.count
        }
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model: model
        if isFiltering() {
            model = filteredViewModels[indexPath.row]
        } else {
            model = viewModels[indexPath.row]
        }
        return tableView.dequeueReusableCell(withModel: model, for: indexPath)
    }
}

extension AnalysisSelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let title = viewModels[indexPath.row].name
        text = title
        output.selectAnalysis(text: title)
    }
}

extension AnalysisSelectionViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
}

extension AnalysisSelectionViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        let model = AnalysisDataViewModel.init(image: image, title: text)
        completionHandler?(model)
        dismiss(animated: true) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

