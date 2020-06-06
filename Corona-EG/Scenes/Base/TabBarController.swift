//
//  TabBarController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/6/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    // MARK: - Methods
    fileprivate func setupTabBarController() {
        tabBar.cornerRadius = 20
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor.mainColor
        tabBar.unselectedItemTintColor = UIColor.lightGray
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.init(name: "HelveticaNeue-Bold", size: 10) ?? UIFont.defaultFont(8, .Bold)
        ]
        guard let items = tabBar.items else { return }
        for item in items {
            item.setTitleTextAttributes(titleAttributes, for: .normal)
            if item.tag == 0 {
                item.title = "news".localizedString()
            } else if item.tag == 1 {
                item.title = "updates".localizedString()
            } else if item.tag == 2 {
                item.title = "test".localizedString()
            } else {
                item.title = "more".localizedString()
            }
        }
    }
}
