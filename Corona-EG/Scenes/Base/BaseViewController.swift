//
//  BaseViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/26/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import SideMenu

// MARK: - Properities
class BaseViewController: UIViewController {
    var menu: SideMenuNavigationController?
    let currentLanguage = LocalizationSystem.sharedInstance.getLanguage()
}


// MARK: - SideMenu
extension BaseViewController {
    func setupSideMenu() {
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.presentationStyle.backgroundColor = UIColor.clear
        menu?.setNavigationBarHidden(true, animated: false)
        if checkForEnglishLanguage(currentLanguage) {
            SideMenuManager.default.leftMenuNavigationController = menu
//            SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        } else {
            SideMenuManager.default.rightMenuNavigationController = menu
//            SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        }
//        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.view)
    }
}


// MARK: - NavigationBar
extension BaseViewController {
    final var navbar: UINavigationBar {
        return self.navigationController!.navigationBar
    }
    
    func setupNavigationBar(navbarTitle: String) {
        navbar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navbar.shadowImage = UIImage()
        navbar.barStyle = UIBarStyle.default
        
        navigationItem.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: navbarTitle, comment: "")
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.defaultFont(20, .Bold),
            .foregroundColor: UIColor.navbarTitleColor
        ]
        navbar.titleTextAttributes = titleAttributes
        
        // MARK: Letf Button
        let leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "list.dash"),
            style: .done, target: self,
            action: #selector(leftSideBarButtonItemTapped(_:)))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.navbarButtonColor
        
        // MARK: right Button
        let languageType = LocalizationSystem.sharedInstance.localizedStringForKey(key: "language_type", comment: "")
        let rightBarButtonItem = UIBarButtonItem(
            title: languageType,
            style: .done, target: self,
            action: #selector(rightSideBarButtonItemTapped(_:)))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.defaultFont(18, .Bold),
            .foregroundColor: UIColor.navbarButtonColor
        ]
        navigationItem.rightBarButtonItem?.setTitleTextAttributes(attributes, for: .normal)
    }
    
    @objc func leftSideBarButtonItemTapped(_ sender: UIBarButtonItem!) {
        present(menu!, animated: true, completion: nil)
    }
    
    @objc func rightSideBarButtonItemTapped(_ sender: UIBarButtonItem!) {
        let changeLanguageTitle = LocalizationSystem.sharedInstance.localizedStringForKey(key: "change_language_title", comment: "")
        let changeLanguageMessage = LocalizationSystem.sharedInstance.localizedStringForKey(key: "change_language_message", comment: "")
        let buttonTitle = LocalizationSystem.sharedInstance.localizedStringForKey(key: "chnage_language_button_title", comment: "")
        presentGenericAlert(viewController: self, title: changeLanguageTitle, message: changeLanguageMessage, buttonTitle: buttonTitle) { (_) in
            self.changeLanguage()
        }
    }
    
}


// MARK: - ChangeLanguage
extension BaseViewController {
    func checkForEnglishLanguage(_ currentLanguage: String) -> Bool {
        if currentLanguage == "en" { return true } else { return false }
    }
    
    
    func changeLanguage() {
        if checkForEnglishLanguage(currentLanguage) {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "UINavigationController") as! SideMenuNavigationController
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = vc
    }
}


// MARK: - GenericAlert
extension BaseViewController {
    func presentGenericAlert(viewController: UIViewController, title: String, message: String, buttonTitle: String, completion: @escaping(_ done: Bool) -> Void = {_ in}) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: buttonTitle, style: .default) { (_) in
            completion(true)
        }
        alert.addAction(dismissAction)
        viewController.present(alert, animated: true, completion: nil)
    }
}
