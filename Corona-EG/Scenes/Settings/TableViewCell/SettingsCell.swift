//
//  SettingsCell.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/2/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell, SettingsCellView {
    @IBOutlet private weak var settingImageView: UIImageView!
    @IBOutlet private weak var settingTitleLabel: UILabel!
    
    func displaySettingIcon(_ iconName: String) {
        settingImageView.image = UIImage(named: iconName)
    }
    
    func displaySettingTitle(_ title: String) {
        settingTitleLabel.text = title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
