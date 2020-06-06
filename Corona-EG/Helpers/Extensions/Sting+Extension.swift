//
//  Sting+Extension.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/5/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

extension String {
    func localizedString() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
