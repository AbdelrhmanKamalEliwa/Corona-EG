//
//  InfectionMethodCell.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/29/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class InfectionMethodCell: UITableViewCell, InfectionMethodsCellView {
    
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var answerLabel: UILabel!
    
    func displayQuestion(_ question: String) {
        questionLabel.text = question
    }
    
    func displayAnswer(_ answer: String) {
        answerLabel.text = answer
    }
    
    private func displayCellUI() {
        questionLabel.textColor = UIColor.titleColor
        answerLabel.textColor = UIColor.subTitleColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        displayCellUI()
    }
}
