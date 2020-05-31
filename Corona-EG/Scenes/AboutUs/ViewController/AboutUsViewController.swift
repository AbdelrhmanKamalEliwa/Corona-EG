//
//  AboutUsViewController.swift
//  Drinky
//
//  Created by Awady on 5/5/20.
//  Copyright © 2020 Ahmed Elawady. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet private weak var holderBackgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCloseTouch()
    }

    private func setupCloseTouch() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AboutUsViewController.closeTab(_:)))
        holderBackgroundView.addGestureRecognizer(closeTouch)
    }

    @objc private func closeTab(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func gotItPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func socilaMediaButtonTapped(_ sender: UIButton) {
        let button = SocialMediaCases(rawValue: sender.tag)
        switch button {
        case .Facebook:
            print("")
        case .Twitter:
            print("")
        case .LinkedIn:
            print("")
        case .GitHub:
            print("")
        case .Gmail:
            print("")
        case .none:
            break
        }
    }
    
}
