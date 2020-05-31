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
    func displayLabel(_ tip: String)
}

class PreventionTipsViewControllerPresenter {
    private weak var view: PreventionTipsView?
    private let preventionTipsData = PreventionTipsData().data
    
    init(view: PreventionTipsView?) {
        self.view = view
    }
    
    func getMethodsCount() -> Int {
        preventionTipsData.count
    }
    
    func cellConfiguartion(cell: PreventionTipsCellView, for index: Int) {
        let preventionTip = preventionTipsData[index]
        let tip = LocalizationSystem.sharedInstance.localizedStringForKey(key: preventionTip, comment: "")
        cell.displayLabel(tip)
    }
}
