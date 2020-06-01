//
//  MoreRouter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class MoreRouter {
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
    
    func navigateToEmergencyContactsScreen(from view: MoreView?) {
        let emergencyContactsView = EmergencyContactsViewControllerRouter.createEmergencyContactsViewController()
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(emergencyContactsView, animated: true)
        }
    }
    
//    func navigateToAboutUsScreen(from view: MoreView?) -> UIViewController {
//        let aboutUsView = AboutUsRouter.createAboutUsVC()
//        return aboutUsView
//    }
}
