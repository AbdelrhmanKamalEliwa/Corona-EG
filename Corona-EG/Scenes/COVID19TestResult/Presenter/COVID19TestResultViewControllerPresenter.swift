//
//  COVID19TestResultViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/2/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

protocol COVID19TestResultView: class {
    var presenter: COVID19TestResultViewControllerPresenter? { get set }
    func displayScreenTitle(_ title: String)
    func displayResultTitle(_ title: String, color: String)
    func displayResultDescription(_ description: String)
    func displayDoneButtonTitle(_ text: String)
}


class COVID19TestResultViewControllerPresenter {
    private weak var view: COVID19TestResultView?
    private let resultData = ResultScreenData().data
    private let score: Int!
    
    init(view: COVID19TestResultView?, score: Int) {
        self.view = view
        self.score = score
    }
    
    func viewDidLoad() {
        displayData()
    }
    
    private func displayData() {
        setScreenTitle()
        setDoneButtonTitle()
        if score <= 4 {
            setScreenData(at: 0, color: "#388E3C")
        } else if score > 4 && score <= 6 {
            setScreenData(at: 1, color: "#FDD835")
        } else if score > 6 {
            setScreenData(at: 2, color: "#E64A19")
        }
    }
    
    private func setScreenTitle() {
        let title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "screen_title", comment: "")
        view?.displayScreenTitle(title)
    }
    
    private func setDoneButtonTitle() {
        let title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "screen_result_button", comment: "")
        view?.displayDoneButtonTitle(title)
    }
    
    private func setScreenData(at screenIndex: Int, color: String) {
        let resultTitle = LocalizationSystem.sharedInstance.localizedStringForKey(key: resultData[screenIndex].title, comment: "")
        view?.displayResultTitle(resultTitle, color: color)
        let resultDescription = LocalizationSystem.sharedInstance.localizedStringForKey(key: resultData[screenIndex].description, comment: "")
        view?.displayResultDescription(resultDescription)
    }
}
