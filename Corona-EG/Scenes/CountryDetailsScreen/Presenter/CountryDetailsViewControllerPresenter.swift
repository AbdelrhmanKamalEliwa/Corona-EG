//
//  CountryDetailsViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

protocol CountryDetailsView: class {
    var presenter: CountryDetailsViewControllerPresenter? { get set }
}

protocol CountryDetailsCellView {
    func displayData(_ number: String)
}

class CountryDetailsViewControllerPresenter {
    private weak var view: CountryDetailsView?
    private var country: CountryDataModel?
    private let countryDataTitles = CountryData().dataTitles
    
    init(view: CountryDetailsView?, country: CountryDataModel?) {
        self.view = view
        self.country = country
    }
    
    func getCountryName() -> String {
        if let country = country?.country { return country } else { return "" }
    }
    
    func getLatitude() -> Double {
        if let latitude = country?.lat {
            return latitude
        } else {
            return 0
        }
    }
    
    func getLongitude() -> Double {
        if let longitude = country?.lng {
            return longitude
        } else {
            return 0
        }
    }
    
    func numberOfSections() -> Int {
        countryDataTitles.count
    }
    
    func numberOfRowsInSection() -> Int { 1 }
    
    func cellConfiguration(cell: CountryDetailsCellView, forSection section: Int, forIndex index: Int) {
        guard let country = country else { return }
        let data = [
            [country.totalConfirmed],
            [country.totalDeaths],
            [country.totalRecovered],
            [country.activeCases],
            [country.dailyConfirmed],
            [country.dailyDeaths],
            [country.totalCritical]
        ]
        guard let cellData = data[section][index] else { return }
        cell.displayData(String(cellData))
    }
    
    func sectionTitle(for section: Int) -> String {
        let sectionTitle = countryDataTitles[section]
        let title = LocalizationSystem.sharedInstance.localizedStringForKey(key: sectionTitle, comment: "")
        return title
    }
}
