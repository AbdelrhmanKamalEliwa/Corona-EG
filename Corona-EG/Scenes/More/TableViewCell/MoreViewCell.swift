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
    
    func displayScreenIcon(_ iconName: String) {
        screenIcon.image = UIImage(named: iconName)
    }
    
    func displayScreenTitle(_ title: String) {
        screenTitle.text = title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
