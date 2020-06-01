//
//  COVID19TestViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import SKActivityIndicatorView

class COVID19TestViewController: BaseViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesAnswerButton: UIButton!
    @IBOutlet weak var noAnswerButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    var presenter: COVID19TestViewControllerPresenter?
    let interactor = COVID19TestInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainScreensNavigationBar(navbarTitle: .COVID19TestScreen)
        presenter = COVID19TestViewControllerPresenter(view: self, interactor: interactor)
        displayContainerViewUI()
        displayAnswerButtonsUI()
        displayQuestionLabelUI()
        displayProgressViewUI()
        presenter?.viewDidLoad()
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        presenter?.answerButtonTapped(sender.tag)
    }
    
    
    func displayContainerViewUI() {
        containerView.layer.masksToBounds = false
        containerView.backgroundColor = UIColor.white
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 10
        containerView.layer.cornerRadius = 5
    }
    
    func displayAnswerButtonsUI() {
        yesAnswerButton.layer.masksToBounds = false
        yesAnswerButton.backgroundColor = #colorLiteral(red: 0, green: 0.6233705282, blue: 0.3099619448, alpha: 1)
        yesAnswerButton.tintColor = UIColor.white
        yesAnswerButton.layer.cornerRadius = 25
        
        noAnswerButton.layer.masksToBounds = false
        noAnswerButton.backgroundColor = #colorLiteral(red: 0.741633296, green: 0.2273621857, blue: 0.1601242423, alpha: 1)
        noAnswerButton.tintColor = UIColor.white
        noAnswerButton.layer.cornerRadius = 25
    }
    
    func displayQuestionLabelUI() {
        questionLabel.textColor = UIColor.titleColor
    }
    
    func displayProgressViewUI() {
        progressView.tintColor = UIColor.mainColor
    }
}

// MARK: - Presenter Delegate
extension COVID19TestViewController: COVID19TestView {
    func displayProgressView(_ number: Float) {
        progressView.progress = number
    }
    
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func displayData(_ question: String, _ yesAnswerButtonTitle: String, _ noAnswerButtonTitle: String) {
        questionLabel.text = question
        yesAnswerButton.setTitle(yesAnswerButtonTitle, for: .normal)
        noAnswerButton.setTitle(noAnswerButtonTitle, for: .normal)
    }
    
    func showError(error: String) {
//
    }
    
    
}
