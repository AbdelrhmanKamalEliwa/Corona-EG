//
//  COVID19TestResultRouter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/2/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class COVID19TestResultRouter {
    class func createCOVID19TestResultVC(score: Int) -> UIViewController {
        let covid19TestResultVC = COVID19TestResultViewController()
        let presenter = COVID19TestResultViewControllerPresenter(view: covid19TestResultVC, score: score)
        covid19TestResultVC.presenter = presenter
        return covid19TestResultVC
    }
}
