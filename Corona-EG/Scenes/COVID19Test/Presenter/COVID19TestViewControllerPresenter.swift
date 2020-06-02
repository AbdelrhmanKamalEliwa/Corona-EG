//
//  COVID19TestViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/1/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

protocol COVID19TestView: class {
    var presenter: COVID19TestViewControllerPresenter? { get set }
    func showIndicator()
    func hideIndicator()
    func displayData(_ question: String, _ yesAnswerButtonTitle: String, _ noAnswerButtonTitle: String)
    func displayProgressView(_ number: Float)
    func showError(error: String)
    func navigateToResultScreen(score: Int)
}


class COVID19TestViewControllerPresenter {
    
    private weak var view: COVID19TestView?
    private let interactor: COVID19TestInteractor
    private var data: [CoronaTestModel] = []
    private var questions: [Question] = []
    private let currentLanguage = LocalizationSystem.sharedInstance.getLanguage()
    private var questionNumber = 0
    private var count = 0
    private var score = 0
    
    init(view: COVID19TestView?, interactor: COVID19TestInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        getData()
    }
    
    func answerButtonTapped(_ userAnswer: Int) {
        checkAnswer(userAnswer)
        nextQuestion()
        view?.displayData(getQuestionTitle(), getYesAnswerButtonTitle(), getNoAnswerButtonTitle())
        view?.displayProgressView(getProgress())
    }
    
    
    private func getData() {
        view?.showIndicator()
        interactor.getData { [weak self] (data, error) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let data = data else { return }
                self.data = data
                self.checkDataLanguage()
                self.view?.displayData(
                    self.getQuestionTitle(),
                    self.getYesAnswerButtonTitle(),
                    self.getNoAnswerButtonTitle())
                self.view?.displayProgressView(self.getProgress())
            }
        }
    }
    
    private func checkDataLanguage() {
        for data in data {
            if data.language == currentLanguage {
                questions = data.data
            }
        }
    }
    
    private func getQuestionTitle() -> String {
        return questions[questionNumber].question
    }
    
    private func getYesAnswerButtonTitle() -> String {
        return questions[questionNumber].answer[0].answer
    }
    
    private func getNoAnswerButtonTitle() -> String {
        return questions[questionNumber].answer[1].answer
    }
    
    private func checkAnswer(_ answer: Int) {
        if answer == 1 {
            score += questions[questionNumber].answer[0].value
        } else {
            score += questions[questionNumber].answer[1].value
        }
    }
    
    private func nextQuestion() {
        if questionNumber + 1 < questions.count {
            questionNumber += 1
        } else {
            view?.navigateToResultScreen(score: score)
            questionNumber = 0
            score = 0
        }
    }
    
    private func getProgress() -> Float {
        return Float(questionNumber) / Float(questions.count)
    }
}
