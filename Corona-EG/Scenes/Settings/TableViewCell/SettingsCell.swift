//
//  SettingsCell.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/2/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell, SettingsCellView {
    
    // MARK: - Properties
    @IBOutlet private weak var settingImageView: UIImageView!
    @IBOutlet private weak var settingTitleLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    func displaySettingIcon(_ iconName: String) {
        settingImageView.image = UIImage(named: iconName)
    }
    
    func displaySettingTitle(_ title: String) {
        settingTitleLabel.text = title
    }
}
