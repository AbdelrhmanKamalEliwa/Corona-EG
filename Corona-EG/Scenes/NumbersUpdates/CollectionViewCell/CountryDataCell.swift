//
//  CountryDataCell.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class CountryDataCell: UICollectionViewCell, NumbersUpdatesCellView {
    @IBOutlet private weak var moreDetailsBtnLabel: UILabel!
    @IBOutlet private weak var countryNameLabel: UILabel!
    @IBOutlet private weak var totalConfirmedNumberLabel: UILabel!
    @IBOutlet private weak var totalDeathsNumberLabel: UILabel!
    @IBOutlet private weak var totalRecoverdNumberLabel: UILabel!
    @IBOutlet private weak var activeCasesNumberLabel: UILabel!
    @IBOutlet private weak var totalConfirmedLabel: UILabel!
    @IBOutlet private weak var totalDeathsLabel: UILabel!
    @IBOutlet private weak var totalRecoverdLabel: UILabel!
    @IBOutlet private weak var activeCasesLabel: UILabel!
    
    func displayMoreDetailsLabel(_ moreDetailsLabel: String) {
        moreDetailsBtnLabel.text = moreDetailsLabel
    }
    
    func displyaCountryNameLabel(_ countyName: String?) {
        countryNameLabel.text = countyName
    }
    
    func displayTotalConfirmedNumber(_ number: String?) {
        totalConfirmedNumberLabel.text = number
    }
    
    func displayTotalDeathsNumber(_ number: String?) {
        totalDeathsNumberLabel.text = number
    }
    
    func displayTotalRecoverdNumber(_ number: String?) {
        totalRecoverdNumberLabel.text = number
    }
    
    func displayActiveCasesNumber(_ number: String?) {
        activeCasesNumberLabel.text = number
    }
    
    func displayTotalConfirmedLabel(_ label: String?) {
        totalConfirmedLabel.text = label
    }
    
    func displayTotalDeathsLabel(_ label: String?) {
        totalDeathsLabel.text = label
    }
    
    func displayTotalRecoverdLabel(_ label: String?) {
        totalRecoverdLabel.text = label
    }
    
    func displayActiveCasesLabel(_ label: String?) {
        activeCasesLabel.text = label
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countryNameLabel.textColor = UIColor.white
        totalConfirmedLabel.textColor = UIColor.navbarButtonColor
        totalDeathsLabel.textColor = UIColor.navbarButtonColor
        totalRecoverdLabel.textColor = UIColor.navbarButtonColor
        activeCasesLabel.textColor = UIColor.navbarButtonColor
    }

}
