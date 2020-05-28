//
//  CounrtyDetailsCell.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class CounrtyDetailsCell: UITableViewCell, CountryDetailsCellView {
    @IBOutlet private weak var dataTitleLabel: UILabel!
    
    func displayData(_ number: String) {
        dataTitleLabel.text = number
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
