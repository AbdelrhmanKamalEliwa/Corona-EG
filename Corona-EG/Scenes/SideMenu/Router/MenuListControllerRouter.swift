//
//  MenuListControllerRouter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class MenuListControllerRouter {
    private enum Constants {
        static let identifier = "UINavigationController"
    }
    
    class var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func menuListViewController() -> UIViewController {
        let navigationController = mainStoryboard.instantiateViewController(identifier: Constants.identifier)
        let view = navigationController.children.first as? MenuTableView
        let router = MenuListControllerRouter()
        let presenter = MenuListControllerPresenter(view: view, router: router)
        view?.presenter = presenter
        return navigationController
    }
    
    func navigateToNewsScreen(from view: MenuTableView?) {
        let newsView = NewsViewControllerRouter.createNewsViewController()
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(newsView, animated: true)
        }
    }
    
    func navigateToEmergencyContactsScreen(from view: MenuTableView?) {
        let emergencyContactsView = EmergencyContactsViewControllerRouter.createEmergencyContactsViewController()
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(emergencyContactsView, animated: true)
        }
    }
    
    func navigateToNumbersUpdatesScreen(from view: MenuTableView?) {
        let numbersUpdatesView = NumbersUpdatesViewControllerRouter.createNumbersUpdatesViewController()
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(numbersUpdatesView, animated: true)
        }
    }
}
