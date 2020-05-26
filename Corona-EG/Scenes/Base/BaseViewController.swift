//
//  BaseViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/26/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import SideMenu

//MARK: - Properities
class BaseViewController: UIViewController {
    var menu: SideMenuNavigationController?
    let currentLanguage = LocalizationSystem.sharedInstance.getLanguage()
}


//MARK: - SideMenu
extension BaseViewController {
    func setupSideMenu() {
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.setNavigationBarHidden(true, animated: false)
        if checkForEnglishLanguage(currentLanguage) {
            SideMenuManager.default.leftMenuNavigationController = menu
        } else {
            SideMenuManager.default.rightMenuNavigationController = menu
        }
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
}


//MARK: - NavigationBar
extension BaseViewController {
    func setupNavigationBar() {
        let nav = self.navigationController?.navigationBar
        nav?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        nav?.shadowImage = UIImage()
        nav?.barStyle = UIBarStyle.default
        //        nav?.tintColor = UIColor.gray
        nav?.titleTextAttributes = [NSAttributedString.Key.font: UIFont.defaultFont(20)]
        navigationItem.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "navbar_title", comment: "")
        
        let leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "list.dash"),
            style: .done, target: self,
            action: #selector(rightSideBarButtonItemTapped(_:)))
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
    }
    
    @objc func rightSideBarButtonItemTapped(_ sender: UIBarButtonItem!) {
        present(menu!, animated: true, completion: nil)
    }
}


//MARK: - ChangeLanguage
extension BaseViewController {
    func checkForEnglishLanguage(_ currentLanguage: String) -> Bool{
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
        let homeViewController = self.storyboard?.instantiateViewController(identifier: "UINavigationController") as! SideMenuNavigationController
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = homeViewController
    }
}
