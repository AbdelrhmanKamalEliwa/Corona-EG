//
//  AboutUsViewController.swift
//  Drinky
//
//  Created by Awady on 5/5/20.
//  Copyright © 2020 Ahmed Elawady. All rights reserved.
//

import UIKit

class COVID19TestResultViewController: UIViewController {
    
    internal var presenter: COVID19TestResultViewControllerPresenter?
    @IBOutlet private weak var screenTitleLabel: UILabel!
    @IBOutlet private weak var resultTitleLabel: UILabel!
    @IBOutlet private weak var resultDescriptionLabel: UILabel!
    @IBOutlet private weak var doneButton: UIButton!
    @IBOutlet private weak var holderBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCloseTouch()
        presenter?.viewDidLoad()
    }
    
    private func setupCloseTouch() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(self.closeTab(_:)))
        holderBackgroundView.addGestureRecognizer(closeTouch)
    }
    
    @objc private func closeTab(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func gotItPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Presenter Delegate
extension COVID19TestResultViewController: COVID19TestResultView {
    
    func displayScreenTitle(_ title: String) {
        screenTitleLabel.text = title
    }
    
    func displayResultTitle(_ title: String, color: String) {
        resultTitleLabel.text = title
        resultTitleLabel.textColor = UIColor(hex: color)
        
//        UIView.animate(withDuration: 1, delay: 0, options: [.repeat], animations: { [weak self] in
//            self?.resultTitleLabel.font = UIFont.defaultFont(20, .Light)
//            self?.view.layoutIfNeeded()
//        }) { [weak self] (_) in
//            self?.resultTitleLabel.font = UIFont.defaultFont(28, .Bold)
//        }
        
    }
    
    func displayResultDescription(_ description: String) {
        resultDescriptionLabel.text = description
    }
    
    func displayDoneButtonTitle(_ text: String) {
        doneButton.setTitle(text, for: .normal)
    }
}
