//
//  EmergencyContactsViewControllerRouter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class EmergencyContactsViewControllerRouter {
    private enum Constants {
        static let identifier = "EmergencyContactsViewController"
    }
    
    class var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createEmergencyContactsViewController() -> UIViewController {
        let emergencyContactsViewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.identifier)
        if let emergencyContactsView = emergencyContactsViewController as? EmergencyContactsView {
            let presenter = EmergencyContactsViewControllerPresenter(view: emergencyContactsView)
            emergencyContactsView.presenter = presenter
        }
        return emergencyContactsViewController
    }
}
