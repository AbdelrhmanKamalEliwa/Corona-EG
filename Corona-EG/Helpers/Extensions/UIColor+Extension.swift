//
//  UIColor+Extensions.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/27/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

extension UIColor {
    class var navbarTitleColor: UIColor { return #colorLiteral(red: 0.2470588237, green: 0.3882353008, blue: 0.5450980663, alpha: 1) }
    class var navbarButtonColor: UIColor { return #colorLiteral(red: 0.2470588237, green: 0.3882353008, blue: 0.5450980663, alpha: 1) }
    class var navbarTintColor: UIColor { return #colorLiteral(red: 0.2470588237, green: 0.3882353008, blue: 0.5450980663, alpha: 1) }
    class var tabbarButtonColor: UIColor { return #colorLiteral(red: 0.2470588237, green: 0.3882353008, blue: 0.5450980663, alpha: 1) }
    class var tabbarSelectedButtonColor: UIColor { return #colorLiteral(red: 0.2470588237, green: 0.3882353008, blue: 0.5450980663, alpha: 1) }
    class var tabbarTintColor: UIColor { return #colorLiteral(red: 0.2470588237, green: 0.3882353008, blue: 0.5450980663, alpha: 1) }
    class var cellBackgroudColor: UIColor { return #colorLiteral(red: 0.916836679, green: 0.916836679, blue: 0.916836679, alpha: 1) }
    class var sideMenuCellBackgroudColor: UIColor { return #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1) }
    class func selectedCellBackgroundColor() -> UIView {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        return backgroundView
    }
    class var unique: UIColor { return #colorLiteral(red: 0.9058823529, green: 0.9058823529, blue: 0.9058823529, alpha: 0.5) }
}
