//
//  PreventionTipsCell.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class PreventionTipsCell: UITableViewCell, PreventionTipsCellView {
    
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var answerLabel: UILabel!
    
    func displayQuestion(_ question: String) {
        questionLabel.text = question
    }
    
    func displayAnswer(_ answer: String) {
        answerLabel.text = answer
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
