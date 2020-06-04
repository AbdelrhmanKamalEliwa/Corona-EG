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
    @IBOutlet private weak var containerView: UIView!
    
    func displayContactName(_ name: String) {
        contactName.text = name
    }
    
    func displayContactNumber(_ number: String) {
        contactNumber.text = number
    }
    
    private func displayCellUI() {
        containerView.layer.masksToBounds = false
        containerView.backgroundColor = UIColor.white
        containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        containerView.layer.shadowColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        containerView.layer.shadowOpacity = 2
        contactName.textColor = UIColor.titleColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        displayCellUI()
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        if selected {
//            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(change), userInfo: nil, repeats: false)
//            contentView.backgroundColor = UIColor.white
//
//        } else {
//            contentView.backgroundColor = UIColor.white
//            containerView.backgroundColor = UIColor.white
//        }
//    }
}
