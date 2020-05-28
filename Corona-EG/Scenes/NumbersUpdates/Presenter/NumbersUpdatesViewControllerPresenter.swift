//
//  NumbersUpdatesViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

protocol NumbersUpdatesView: class {
    var presenter: NumbersUpdatesViewControllerPresenter? { get set }
    func showIndicator()
    func hideIndicator()
    func fetchDataSuccess()
    func showError(error: String)
}

protocol NumbersUpdatesCellView {
    func displayMoreDetailsLabel(_ moreDetailsLabel: String)
    func displyaCountryNameLabel(_ countyName: String?)
    func displayTotalConfirmedNumber(_ number: String?)
    func displayTotalDeathsNumber(_ number: String?)
    func displayTotalRecoverdNumber(_ number: String?)
    func displayActiveCasesNumber(_ number: String?)
    func displayTotalConfirmedLabel(_ label: String?)
    func displayTotalDeathsLabel(_ label: String?)
    func displayTotalRecoverdLabel(_ label: String?)
    func displayActiveCasesLabel(_ label: String?)
}


class NumbersUpdatesViewControllerPresenter {
    
    private weak var view: NumbersUpdatesView?
    private let interactor: NumbersUpdatesInteractor
    private let router: NumbersUpdatesViewControllerRouter
    private var countries: [CountryDataModel] = []
    private var filteredCountries: [CountryDataModel] = []
    private var searching = false
    
    init(view: NumbersUpdatesView?, interactor: NumbersUpdatesInteractor, router: NumbersUpdatesViewControllerRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
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
                self.countries = countries
                self.view?.fetchDataSuccess()
            }
        }
    }
    
    func fetchSearch(_ searchText: String) {
        view?.showIndicator()
        filteredCountries = countries.filter { (country) -> Bool in
            country.country!.lowercased().contains(searchText.lowercased())
        }
        view?.hideIndicator()
        searching = true
        if searchText.isEmpty { searching = false }
        view?.fetchDataSuccess()
    }
    
    func getCountriesCount() -> Int {
        if searching {
            return filteredCountries.count
        } else {
            return countries.count
        }
    }
    
    private func cellLanguageConfiguration(cell: NumbersUpdatesCellView) {
        let moreDetailsLabel = LocalizationSystem.sharedInstance.localizedStringForKey(key: "more_details", comment: "")
        cell.displayMoreDetailsLabel(moreDetailsLabel)
        let totalConfirmedLabel = LocalizationSystem.sharedInstance.localizedStringForKey(key: "total_confirmed", comment: "")
        cell.displayTotalConfirmedLabel(totalConfirmedLabel)
        let totalDeathsLabel = LocalizationSystem.sharedInstance.localizedStringForKey(key: "total_deaths", comment: "")
        cell.displayTotalDeathsLabel(totalDeathsLabel)
        let totalRecoverdLabel = LocalizationSystem.sharedInstance.localizedStringForKey(key: "total_recovered", comment: "")
        cell.displayTotalRecoverdLabel(totalRecoverdLabel)
        let activeCasesLabel = LocalizationSystem.sharedInstance.localizedStringForKey(key: "active_cases", comment: "")
        cell.displayActiveCasesLabel(activeCasesLabel)
    }
    
    func cellConfiguration(cell: NumbersUpdatesCellView, for index: Int) {
        cellLanguageConfiguration(cell: cell)
        if searching {
            let country = filteredCountries[index]
            guard let countryName = country.country else { return }
            cell.displyaCountryNameLabel(countryName)
            guard let totalConfirmedNumber = country.totalConfirmed else { return }
            cell.displayTotalConfirmedNumber(String(totalConfirmedNumber))
            guard let totalDeathsNumber = country.totalDeaths else { return }
            cell.displayTotalDeathsNumber(String(totalDeathsNumber))
            guard let totalRecoverdNumber = country.totalRecovered else { return }
            cell.displayTotalRecoverdNumber(String(totalRecoverdNumber))
            guard let activeCasesNumber = country.activeCases else { return }
            cell.displayActiveCasesNumber(String(activeCasesNumber))
        } else {
            let country = countries[index]
            guard let countryName = country.country else { return }
            cell.displyaCountryNameLabel(countryName)
            guard let totalConfirmedNumber = country.totalConfirmed else { return }
            cell.displayTotalConfirmedNumber(String(totalConfirmedNumber))
            guard let totalDeathsNumber = country.totalDeaths else { return }
            cell.displayTotalDeathsNumber(String(totalDeathsNumber))
            guard let totalRecoverdNumber = country.totalRecovered else { return }
            cell.displayTotalRecoverdNumber(String(totalRecoverdNumber))
            guard let activeCasesNumber = country.activeCases else { return }
            cell.displayActiveCasesNumber(String(activeCasesNumber))
        }
    }
    
    func didSelectRow(at index: Int) {
        if searching {
            let country = filteredCountries[index]
            router.navigateToCountryDetailsScreen(from: view, countryData: country)
        } else {
            let country = countries[index]
            router.navigateToCountryDetailsScreen(from: view, countryData: country)
        }
    }
    
}
