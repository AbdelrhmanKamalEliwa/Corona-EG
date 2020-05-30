//
//  PreventionTipsViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

protocol PreventionTipsView: class {
    var presenter: PreventionTipsViewControllerPresenter? { get set }
}

protocol PreventionTipsCellView {
    func displayQuestion(_ question: String)
    func displayAnswer(_ answer: String)
}

class PreventionTipsViewControllerPresenter {
    private weak var view: PreventionTipsView?
    private let infectionMethodsData = InfectionMethodData().data
    
    init(view: PreventionTipsView?) {
        self.view = view
    }
    
    func getMethodsCount() -> Int {
        infectionMethodsData.count
    }
    
    func cellConfiguartion(cell: PreventionTipsCellView, for index: Int) {
        let infectionMethod = infectionMethodsData[index]
        let question = LocalizationSystem.sharedInstance.localizedStringForKey(key: infectionMethod.question, comment: "")
        cell.displayQuestion(question)
        let answer = LocalizationSystem.sharedInstance.localizedStringForKey(key: infectionMethod.answer, comment: "")
        cell.displayAnswer(answer)
    }
}
