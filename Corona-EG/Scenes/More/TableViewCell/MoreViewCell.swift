//
//  MoreViewCell.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class MoreViewCell: UITableViewCell, MoreCellView {
    
    @IBOutlet private weak var screenIcon: UIImageView!
    @IBOutlet private weak var screenTitle: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    func displayScreenIcon(_ iconName: String) {
        screenIcon.image = UIImage(named: iconName)
    }
    
    func displayScreenTitle(_ title: String) {
        screenTitle.text = title
    }
    
    private func displayCellUI() {
        containerView.layer.masksToBounds = false
        containerView.backgroundColor = UIColor.white
        containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        containerView.layer.shadowColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        containerView.layer.shadowOpacity = 2
        screenTitle.textColor = UIColor.titleColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        displayCellUI()
    }
}
