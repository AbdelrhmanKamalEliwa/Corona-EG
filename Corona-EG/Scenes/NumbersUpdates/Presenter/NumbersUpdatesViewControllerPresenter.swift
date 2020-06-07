//
//  NumbersUpdatesViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

// MARK: - Numbers Updates View Protocol
protocol NumbersUpdatesView: class {
    var presenter: NumbersUpdatesViewControllerPresenter? { get set }
    func showIndicator()
    func hideIndicator()
    func fetchDataSuccess()
    func showError(error: String)
}

// MARK: - Country Data Cell View Protocol
protocol CountryDataCellView {
    func displyaCountryName(_ countryName: String)
    func displayCountryImage(_ countryImage: String?)
    func displayTotalConfirmed(_ totalConfirmedLabel: String, _ totalConfirmedNumber: String?)
    func displayTotalDeaths(_ totalDeathsLabel: String, _ totalDeathsNumber: String?)
    func displayTotalRecoverd(_ totalRecoverdLabel: String, _ totalRecoverdNumber: String?)
    func displayActiveCases(_ activeCasesLabel: String, _ activeCasesNumber: String?)
    func displayDailyConfirmed(_ dailyConfirmedLabel: String, _ dailyConfirmedNumber: String?)
    func displayDailyDeaths(_ dailyDeathsLabel: String, _ dailyDeathsNumber: String?)
    func displayTotalCritical(_ totalCriticalLabel: String, _ totalCriticalNumber: String?)
}


class NumbersUpdatesViewControllerPresenter {
    
    // MARK: - Properties
    private weak var view: NumbersUpdatesView?
    private let interactor: NumbersUpdatesInteractor
    private var countries: [CountryDataModel] = []
    private var filteredCountries: [CountryDataModel] = []
    private var searching = false
    private var isCollapce = false
    private var selectedIndex = -1
    
    // MARK: - init
    init(view: NumbersUpdatesView?, interactor: NumbersUpdatesInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    // MARK: - Methods
    func viewDidLoad() {
        getCountriesData()
    }
    
    private func getCountriesData() {
        view?.showIndicator()
        interactor.getCountriesData { [weak self] (countries, error) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let countries = countries else { return }
                self.countries = countries.filter { (country) -> Bool in
                    country.countryCode != nil
                }
                self.view?.fetchDataSuccess()
            }
        }
    }
    
    func fetchSearch(_ searchText: String) {
        filteredCountries = countries.filter { (country) -> Bool in
            country.country!.lowercased().contains(searchText.lowercased())
        }
        searching = true
        if searchText.isEmpty { searching = false }
        view?.fetchDataSuccess()
    }
    
    func getCountriesCount() -> Int {
        ifSearching().count
    }
    
    
    private func getTotalConfirmedLabel() -> String {
        return "total_confirmed".localizedString()
    }
    
    private func getTotalDeathsLabel() -> String {
        return "total_deaths".localizedString()
    }
    
    private func getTotalRecoverdLabel() -> String {
        return "total_recovered".localizedString()
    }
    
    private func getActiveCasesLabel() -> String {
        return "active_cases".localizedString()
    }
    
    private func getDailyConfirmedLabel() -> String {
        return "daily_confirmed".localizedString()
    }
    
    private func getDailyDeathsLabel() -> String {
        return "daily_deaths".localizedString()
    }
    
    private func getTotalCriticalLabel() -> String {
        return "total_critical".localizedString()
    }
    
    private func ifSearching() -> [CountryDataModel] {
        if searching {
            return filteredCountries
        } else {
            return countries
        }
    }
    
    func cellConfiguration(cell: CountryDataCellView, for index: Int) {
        let country = ifSearching()[index]
        guard let countryImage = country.countryCode else { return }
        cell.displayCountryImage(countryImage)
        guard let countryName = country.country else { return }
        cell.displyaCountryName(countryName)
        guard let totalConfirmedNumber = country.totalConfirmed else { return }
        cell.displayTotalConfirmed(getTotalConfirmedLabel(), String(totalConfirmedNumber))
        guard let totalDeathsNumber = country.totalDeaths else { return }
        cell.displayTotalDeaths(getTotalDeathsLabel(), String(totalDeathsNumber))
        guard let totalRecoverdNumber = country.totalRecovered else { return }
        cell.displayTotalRecoverd(getTotalRecoverdLabel(), String(totalRecoverdNumber))
        guard let activeCasesNumber = country.activeCases else { return }
        cell.displayActiveCases(getActiveCasesLabel(), String(activeCasesNumber))
        guard let dailyConfirmedNumber = country.dailyConfirmed else { return }
        cell.displayDailyConfirmed(getDailyConfirmedLabel(), String(dailyConfirmedNumber))
        guard let dailyDeathsNumber = country.dailyDeaths else { return }
        cell.displayDailyDeaths(getDailyDeathsLabel(), String(dailyDeathsNumber))
        guard let totalCriticalNumber = country.totalCritical else { return }
        cell.displayTotalCritical(getTotalCriticalLabel(), String(totalCriticalNumber))
    }
    
    func didSelectRow(cell: CountryDataCellView, at index: Int) {
        if selectedIndex == index {
            if isCollapce == false {
                isCollapce = true
            } else {
                isCollapce = false
            }
        } else {
            isCollapce = true
        }
        selectedIndex = index
    }
    
    func heightForRow(at index: Int) -> Int {
        if selectedIndex == index && isCollapce == true {
            return 400
        } else {
            return 50
        }
    }
    
}
