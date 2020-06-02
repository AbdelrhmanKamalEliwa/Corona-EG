//
//  UITabBar+Extension.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/31/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

extension UITabBar {
    static public func setupTabBar() {
        UITabBar.appearance().cornerRadius = 20
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor.mainColor
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
    }
}
