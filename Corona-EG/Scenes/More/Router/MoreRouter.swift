//
//  MoreRouter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class MoreRouter {
//    private enum Constants {
//        static let identifier = "NewsViewController"
//    }

//    class var mainStoryboard: UIStoryboard {
//        return UIStoryboard(name: "Main", bundle: Bundle.main)
//    }

//    class func createRouterViewController() -> UIViewController {
//        let newsViewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.identifier)
//        let interactor = NewsInteractor()
//        if let newsView = newsViewController as? NewsView {
//            let presenter = NewsViewControllerPresenter(view: newsView, interactor: interactor)
//            newsView.presenter = presenter
//        }
//        return newsViewController
//    }
    
    func navigateToInfectionMethodsScreen(from view: MoreView?) {
        let infectionMethodsView = InfectionMethodsRouter.createInfectionMethodsVC()
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(infectionMethodsView, animated: true)
        }
    }
    
    func navigateToPreventionTipsScreen(from view: MoreView?) {
        let preventionTipsView = PreventionTipsRouter.createPreventionTipsVC()
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(preventionTipsView, animated: true)
        }
    }
}
