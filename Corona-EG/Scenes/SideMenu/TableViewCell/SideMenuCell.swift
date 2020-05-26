//
//  SideMenuCell.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/26/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell, HomeCellView {

    @IBOutlet private weak var itemIcon: UIImageView!
    @IBOutlet private weak var itemLabel: UILabel!
    
    func displayItemIcon(_ iconName: String) {
        itemIcon.image = UIImage(named: iconName)
    }
    
    func displayItemLabel(_ itemName: String) {
        itemLabel.text = itemName
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
