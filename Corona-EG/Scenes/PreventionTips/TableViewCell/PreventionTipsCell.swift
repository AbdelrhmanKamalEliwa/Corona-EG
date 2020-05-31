//
//  PreventionTipsCell.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class PreventionTipsCell: UITableViewCell, PreventionTipsCellView {
    
    @IBOutlet private weak var tipLabel: UILabel!
    
    func displayLabel(_ answer: String) {
        tipLabel.text = answer
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
