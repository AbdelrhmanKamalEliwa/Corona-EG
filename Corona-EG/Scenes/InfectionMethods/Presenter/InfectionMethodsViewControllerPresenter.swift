//
//  InfectionMethodsViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

// MARK: - Infection Methods View Protocol
protocol InfectionMethodsView: class {
    var presenter: InfectionMethodsViewControllerPresenter? { get set }
    func showError(_ error: String)
}

// MARK: - Infection Methods Cell View Protocol
protocol InfectionMethodsCellView {
    func displayQuestion(_ question: String)
    func displayAnswer(_ answer: String)
}

class InfectionMethodsViewControllerPresenter {
    
    // MARK: - Properties
    private weak var view: InfectionMethodsView?
    private let interactor: InfectionMethodsInteractor
    private var infectionMethods: [InfectionMethodsModel] = []
    private var infectionMethodsQuestions: [InfectionMethodQuestion] = []
    private let currentLanguage = "currentAppLanguage".localizedString()
    
    // MARK: - init
    init(view: InfectionMethodsView?, interactor: InfectionMethodsInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    // MARK: - Methods
    func viewDidLoad() {
        getData()
    }
    
    private func getData() {
        interactor.getData { [weak self] (data, error) in
            guard let self = self else { return }
            if let error = error {
                self.view?.showError(error.localizedDescription)
            } else {
                guard let data = data else { return }
                self.infectionMethods = data
                self.checkDataLanguage()
            }
        }
    }
    
    private func checkDataLanguage() {
        for data in infectionMethods {
            if data.language == currentLanguage {
                infectionMethodsQuestions = data.data
            }
        }
    }
    
    func getMethodsCount() -> Int {
        infectionMethodsQuestions.count
    }
    
    func cellConfiguartion(cell: InfectionMethodsCellView, for index: Int) {
        let infectionMethod = infectionMethodsQuestions[index]
        let question = infectionMethod.question
        cell.displayQuestion(question)
        let answer = infectionMethod.answer
        cell.displayAnswer(answer)
    }
}
