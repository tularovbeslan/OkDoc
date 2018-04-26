//
//  DoctorDetailViewController.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

final class DoctorDetailViewController: UIViewController, DoctorDetailViewInput, StoryboardInitializable, TransitionHandler {

    // MARK: - Properties
    var output: DoctorDetailViewOutput!
    var viewModels: [DoctorsViewModel] = []
    var sections: [SectionType] = [.common, .info]
    // MARK: - IBOutlets
    @IBOutlet weak var backArrow: UIButton!
    @IBOutlet weak var burgerMenu: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var makeAnOppointment: OkDocButton!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: - IBActions
    @IBAction func backArrowDidPress(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func burgerMenuDidPress(_ sender: UIButton) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    @IBAction func oppointmentDidPress(_ sender: OkDocButton) {
        output.oppointmentDidPress()
    }
    
    
    
    // MARK: ProfileViewInput
    func setupInitialState() {
        configureTableView()
        configureMakeAnOppointment()
    }
    
    func setNavigationBarBackButton(title: String) {
        navigationItem.leftBarButtonItem?.title = title
    }
    
    //MARK: - Helpers
    func configureTableView() {
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 65, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nibModels: [DoctorDetailCommonInfoViewModel.self, DoctorDetailInfoViewModel.self])
    }
    
    func configureMakeAnOppointment() {
        makeAnOppointment.setTitle(text: "Записаться на консультацию")
        makeAnOppointment.setPrice(text: "990 руб.")
        makeAnOppointment.layer.cornerRadius = 14
        makeAnOppointment.backgroundColor = UIColor(red:125/255.0, green:76/255.0, blue:245/255.0, alpha: 1)
    }
    
    func makeAnOppointment(animation: CGAffineTransform) {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.makeAnOppointment.transform = animation
        }, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension DoctorDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = sections[indexPath.section]
        switch type {
        case .common:
            return tableView.dequeueReusableCell(withModel: DoctorDetailCommonInfoViewModel(), for: indexPath)
        case .info:
            return tableView.dequeueReusableCell(withModel: DoctorDetailInfoViewModel(), for: indexPath)
        }
    }
}

// MARK: - UITableViewDelegate
extension DoctorDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

// MARK: - UIScrollViewDelegate
extension DoctorDetailViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let animation = CGAffineTransform(translationX: 0, y: 100)
        makeAnOppointment(animation: animation)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        makeAnOppointment(animation: CGAffineTransform.identity)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        makeAnOppointment(animation: CGAffineTransform.identity)
    }
}

// MARK: - UIGestureRecognizerDelegate
extension DoctorDetailViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension DoctorDetailViewController {
    enum SectionType {
        case common
        case info
    }
}
