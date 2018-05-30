//
//  CategorySelectionCategorySelectionPresenter.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class CategorySelectionPresenter: CategorySelectionModuleInput, CategorySelectionViewOutput, CategorySelectionInteractorOutput {

    weak var view: CategorySelectionViewInput!
    var interactor: CategorySelectionInteractorInput!
    var router: CategorySelectionRouterInput!
    var feedbackService: FeedbackService!

    func viewIsReady() {
        view.setupInitialState()
        view.setNavigationBarBackButton(title:"")
        view.setTitleLabel(text: "Наши врачи")
    }
    
    func menuButtonDidPress() {
		if #available(iOS 10.0, *) {
			feedbackService.feedback(by: .impact(.medium))
		}
    }
}
