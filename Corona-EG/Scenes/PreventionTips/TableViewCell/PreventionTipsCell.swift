//
//  PreventionTipsCell.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class PreventionTipsCell: UITableViewCell, PreventionTipsCellView {
    
    // MARK: - Properties
    @IBOutlet private weak var tipLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        displayCellUI()
    }
    
    // MARK: - Methods
    func displayLabel(_ answer: String) {
        tipLabel.text = answer
    }
    
    private func displayCellUI() {
        tipLabel.textColor = UIColor.titleColor
    }
}
