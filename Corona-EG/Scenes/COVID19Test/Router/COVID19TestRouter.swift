//
//  COVID19TestRouter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/1/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class COVID19TestRouter: UIViewController {
    func navigateToAboutUsScreen() {
        let aboutUsScreen = AboutUsViewController()
        aboutUsScreen.modalPresentationStyle = .custom
        aboutUsScreen.modalTransitionStyle = .crossDissolve
        present(aboutUsScreen, animated: true, completion: nil)
    }
}
