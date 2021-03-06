//
//  CountryDataTableViewCell.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/3/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import Kingfisher

class CountryDataTableViewCell: UITableViewCell, CountryDataCellView {
    
    // MARK: - Properties
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var bodyViewCountryImage: UIImageView!
    @IBOutlet private weak var bodyViewCountryName: UILabel!
    @IBOutlet private weak var bodyViewTotalConfirmedNumber: UILabel!
    @IBOutlet private weak var bodyViewTotalConfirmedLabel: UILabel!
    @IBOutlet private weak var bodyViewTotalDeathsNumber: UILabel!
    @IBOutlet private weak var bodyViewTotalDeathsLabel: UILabel!
    @IBOutlet private weak var bodyViewTotalRecoverdNumber: UILabel!
    @IBOutlet private weak var bodyViewTotalRecoverdLabel: UILabel!
    @IBOutlet private weak var bodyViewActiveCasesNumber: UILabel!
    @IBOutlet private weak var bodyViewActiveCasesLabel: UILabel!
    @IBOutlet private weak var bodyViewDailyConfirmedNumber: UILabel!
    @IBOutlet private weak var bodyViewDailyConfirmedLabel: UILabel!
    @IBOutlet private weak var bodyViewDailyDeathsNumber: UILabel!
    @IBOutlet private weak var bodyViewDailyDeathsLabel: UILabel!
    @IBOutlet private weak var bodyViewTotalCriticalNumber: UILabel!
    @IBOutlet private weak var bodyViewTotalCriticalLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        displayCellUI()
    }
    
    // MARK: - Methods
    func displayCountryImage(_ countryImage: String?) {
        let url = EndPointRouter.getCountryFlag(countryCode: countryImage ?? "")
        bodyViewCountryImage.kf.indicatorType = .activity
        bodyViewCountryImage.kf.setImage(
        with: url, placeholder: nil,
        options: nil, progressBlock: nil) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let image):
                self.bodyViewCountryImage.image = image.image
            case .failure:
                self.bodyViewCountryImage.image = UIImage(named: "AppIcon")?.imageFlippedForRightToLeftLayoutDirection()
                return
            }
        }
    }
    
    func displyaCountryName(_ countryName: String) {
        bodyViewCountryName.text = countryName
    }
    
    func displayTotalConfirmed(_ totalConfirmedLabel: String, _ totalConfirmedNumber: String?) {
        bodyViewTotalConfirmedLabel.text = totalConfirmedLabel
        bodyViewTotalConfirmedNumber.text = totalConfirmedNumber
    }
    
    func displayTotalDeaths(_ totalDeathsLabel: String, _ totalDeathsNumber: String?) {
        bodyViewTotalDeathsLabel.text = totalDeathsLabel
        bodyViewTotalDeathsNumber.text = totalDeathsNumber
    }
    
    func displayTotalRecoverd(_ totalRecoverdLabel: String, _ totalRecoverdNumber: String?) {
        bodyViewTotalRecoverdLabel.text = totalRecoverdLabel
        bodyViewTotalRecoverdNumber.text = totalRecoverdNumber
    }
    
    func displayActiveCases(_ activeCasesLabel: String, _ activeCasesNumber: String?) {
        bodyViewActiveCasesLabel.text = activeCasesLabel
        bodyViewActiveCasesNumber.text = activeCasesNumber
    }
    
    func displayDailyConfirmed(_ dailyConfirmedLabel: String, _ dailyConfirmedNumber: String?) {
        bodyViewDailyConfirmedLabel.text = dailyConfirmedLabel
        bodyViewDailyConfirmedNumber.text = dailyConfirmedNumber
    }
    
    func displayDailyDeaths(_ dailyDeathsLabel: String, _ dailyDeathsNumber: String?) {
        bodyViewDailyDeathsLabel.text = dailyDeathsLabel
        bodyViewDailyDeathsNumber.text = dailyDeathsNumber
    }
    
    func displayTotalCritical(_ totalCriticalLabel: String, _ totalCriticalNumber: String?) {
        bodyViewTotalCriticalLabel.text = totalCriticalLabel
        bodyViewTotalCriticalNumber.text = totalCriticalNumber
    }
    
    private func displayCellUI() {
        containerView.layer.masksToBounds = false
        containerView.backgroundColor = UIColor.white
        containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        containerView.layer.shadowColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        containerView.layer.shadowOpacity = 2
        bodyViewCountryName.backgroundColor = UIColor.mainColor
    }
}
