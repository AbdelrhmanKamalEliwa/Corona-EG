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
    class var tabbarTintColor: UIColor { return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) }
    class func selectedCellBackgroundColor() -> UIView {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        return backgroundView
    }
}
