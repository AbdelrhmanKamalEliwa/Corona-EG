//
//  COVID19TestResultViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/2/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

// MARK: - COVID19 Test Result View Protocol
protocol COVID19TestResultView: class {
    var presenter: COVID19TestResultViewControllerPresenter? { get set }
    func displayScreenTitle(_ title: String)
    func displayResultTitle(_ title: String, color: String)
    func displayResultDescription(_ description: String)
    func displayDoneButtonTitle(_ text: String)
}


class COVID19TestResultViewControllerPresenter {
    
    // MARK: - Properties
    private weak var view: COVID19TestResultView?
    private let resultData = ResultScreenData().data
    private let score: Int!
    
    // MARK: - init
    init(view: COVID19TestResultView?, score: Int) {
        self.view = view
        self.score = score
    }
    
    // MARK: - Methods
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
        let title = "screen_title".localizedString()
        view?.displayScreenTitle(title)
    }
    
    private func setDoneButtonTitle() {
        let title = "screen_result_button".localizedString()
        view?.displayDoneButtonTitle(title)
    }
    
    private func setScreenData(at screenIndex: Int, color: String) {
        let resultTitle = resultData[screenIndex].title.localizedString()
        view?.displayResultTitle(resultTitle, color: color)
        let resultDescription = resultData[screenIndex].description.localizedString()
        view?.displayResultDescription(resultDescription)
    }
}
