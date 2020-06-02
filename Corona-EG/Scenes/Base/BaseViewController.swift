//
//  BaseViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/26/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

// MARK: - Properities
class BaseViewController: UIViewController {
    final let currentLanguage = LocalizationSystem.sharedInstance.getLanguage()
}

// MARK: - MainScreensNavigationBar
extension BaseViewController {
    final var navbar: UINavigationBar {
        return self.navigationController!.navigationBar
    }
    
    func setupMainScreensNavigationBar(navbarTitle: MainScreens) {
        navbar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navbar.shadowImage = UIImage()
        navbar.barStyle = UIBarStyle.default
        navbar.prefersLargeTitles = false
        
        let title = LocalizationSystem.sharedInstance.localizedStringForKey(key: navbarTitle.rawValue, comment: "")
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.defaultFont(25, .Bold),
            .foregroundColor: UIColor.mainColor
        ]
        let leftBarButtonItem = UIBarButtonItem(
            title: title,
            style: .done, target: self,
            action: nil)
        leftBarButtonItem.setTitleTextAttributes(titleAttributes, for: .normal)
        navbar.topItem?.leftBarButtonItem = leftBarButtonItem
        
        // MARK: right Button
        let rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "settings"),
            style: .done, target: self,
            action: #selector(rightSideBarButtonItemTapped(_:)))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.rightBarButtonItem?.tintColor = UIColor.mainColor
    }
    
    @objc func rightSideBarButtonItemTapped(_ sender: UIBarButtonItem!) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let settingsVC = storyboard.instantiateViewController(identifier: "SettingsViewController")
        present(settingsVC, animated: true, completion: nil)
    }
}


// MARK: - MainScreensNavigationBar
extension BaseViewController {
    func setupInnerScreensNavigationBar(navbarScreenTitle: InnerScreens?, navbarDefaultTitle: String = "") {
        let navbar = navigationController!.navigationBar
        navbar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navbar.shadowImage = UIImage()
        navbar.barStyle = UIBarStyle.default
        navbar.prefersLargeTitles = true
        
        if let title = navbarScreenTitle {
            navigationItem.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: title.rawValue, comment: "")
        } else {
            navigationItem.title = navbarDefaultTitle
        }
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.defaultFont(20, .Bold),
            .foregroundColor: UIColor.mainColor
        ]
        navbar.titleTextAttributes = titleAttributes
        let largeTitleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.defaultFont(30, .Bold),
            .foregroundColor: UIColor.mainColor
        ]
        navbar.largeTitleTextAttributes = largeTitleAttributes
        
        // MARK: Letf Button
        let leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "back"),
            style: .done, target: self,
            action: #selector(innerLeftSideBarButtonItemTapped(_:)))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.mainColor
    }
    
    @objc func innerLeftSideBarButtonItemTapped(_ sender: UIBarButtonItem!) {
        self.navigationController?.popViewController(animated: true)
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
        let vc = storyboard.instantiateViewController(identifier: "TabBarController") as! UITabBarController
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = vc
    }
}


// MARK: - GenericAlert
extension BaseViewController {
    func presentGenericAlert(viewController: UIViewController, title: String, message: String, doneButtonTitle: String, dismissButtonTitle: String?, completion: @escaping(_ done: Bool) -> Void = {_ in}) {
        
        if dismissButtonTitle != nil {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let doneAction = UIAlertAction(title: doneButtonTitle, style: .cancel) { (_) in
                completion(true)
            }
            let dissmisAction = UIAlertAction(title: dismissButtonTitle, style: .destructive, handler: nil)
            alert.addAction(doneAction)
            alert.addAction(dissmisAction)
            viewController.present(alert, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let doneAction = UIAlertAction(title: doneButtonTitle, style: .cancel) { (_) in
                completion(true)
            }
            alert.addAction(doneAction)
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
