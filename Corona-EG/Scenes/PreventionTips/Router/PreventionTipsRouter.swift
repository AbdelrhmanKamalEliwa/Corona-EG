//
//  PreventionTipsRouter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class PreventionTipsRouter {
    private enum Constants {
        static let identifier = "PreventionTipsViewController"
    }
    
    class var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createPreventionTipsVC() -> UIViewController {
        let preventionTipsViewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.identifier)
        if let preventionTipsView = preventionTipsViewController as? PreventionTipsView {
            let presenter = PreventionTipsViewControllerPresenter(view: preventionTipsView)
            preventionTipsView.presenter = presenter
        }
        return preventionTipsViewController
    }
}
