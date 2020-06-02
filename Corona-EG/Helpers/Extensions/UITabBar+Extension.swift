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
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        UITabBar.appearance().tintColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1)
    }
}
