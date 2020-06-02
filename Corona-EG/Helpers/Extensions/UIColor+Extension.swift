//
//  UIColor+Extensions.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/27/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

extension UIColor {
    class var mainColor: UIColor { return #colorLiteral(red: 0.2470588237, green: 0.3882353008, blue: 0.5450980663, alpha: 1) }
    class var titleColor: UIColor { return #colorLiteral(red: 0.370942235, green: 0.581436336, blue: 0.8314492106, alpha: 1) }
    class var subTitleColor: UIColor { return #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1) }
    class var tabbarTintColor: UIColor { return #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1) }
    class func selectedCellBackgroundColor() -> UIView {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        return backgroundView
    }
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
