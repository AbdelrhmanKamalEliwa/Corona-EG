//
//  InfectionMethodsViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

protocol InfectionMethodsView: class {
    var presenter: InfectionMethodsViewControllerPresenter? { get set }
}

protocol InfectionMethodsCellView {
    func displayQuestion(_ question: String)
    func displayAnswer(_ answer: String)
}

class InfectionMethodsViewControllerPresenter {
    private weak var view: InfectionMethodsView?
    private let infectionMethodsData = InfectionMethodData().data
    
    init(view: InfectionMethodsView?) {
        self.view = view
    }
    
    func getMethodsCount() -> Int {
        infectionMethodsData.count
    }
    
    func cellConfiguartion(cell: InfectionMethodsCellView, for index: Int) {
        let infectionMethod = infectionMethodsData[index]
        let question = LocalizationSystem.sharedInstance.localizedStringForKey(key: infectionMethod.question, comment: "")
        cell.displayQuestion(question)
        let answer = LocalizationSystem.sharedInstance.localizedStringForKey(key: infectionMethod.answer, comment: "")
        cell.displayAnswer(answer)
    }
}
