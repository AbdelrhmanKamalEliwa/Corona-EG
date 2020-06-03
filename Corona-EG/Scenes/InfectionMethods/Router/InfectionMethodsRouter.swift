//
//  InfectionMethodsRouter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class InfectionMethodsRouter {
    private enum Constants {
        static let identifier = "InfectionMethodsViewController"
    }
    
    class var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createInfectionMethodsVC() -> UIViewController {
        let infectionMethodsViewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.identifier)
        let interactor = InfectionMethodsInteractor()
        if let infectionMethodsView = infectionMethodsViewController as? InfectionMethodsView {
            let presenter = InfectionMethodsViewControllerPresenter(view: infectionMethodsView, interactor: interactor)
            infectionMethodsView.presenter = presenter
        }
        return infectionMethodsViewController
    }
}
