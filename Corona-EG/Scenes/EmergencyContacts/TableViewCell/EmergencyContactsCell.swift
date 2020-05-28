//
//  EmergencyContactsCell.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/27/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class EmergencyContactsCell: UITableViewCell, EmergencyContactsCellView {
    
    @IBOutlet private weak var contactName: UILabel!
    @IBOutlet private weak var contactNumber: UILabel!
    
    func displayContactName(_ name: String) {
        contactName.text = name
    }
    
    func displayContactNumber(_ number: String) {
        contactNumber.text = number
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
