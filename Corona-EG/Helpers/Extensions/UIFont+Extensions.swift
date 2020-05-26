//
//  UIFont+Extensions.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/25/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

extension UIFont {
    class func defaultFont(_ size: CGFloat = 12) -> UIFont {
        return UIFont(name:"Cairo", size: size)!
    }
}
