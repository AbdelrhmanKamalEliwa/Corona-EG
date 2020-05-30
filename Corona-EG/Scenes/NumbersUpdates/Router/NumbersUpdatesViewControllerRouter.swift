//
//  NumbersUpdatesViewControllerRouter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class NumbersUpdatesViewControllerRouter {
    func navigateToCountryDetailsScreen(from view: NumbersUpdatesView?, countryData: CountryDataModel) {
        let countryDetailsView = CountryDetailsViewControllerRouter.createRepoDetailsVC(countryData: countryData)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(countryDetailsView, animated: true)
        }
    }
}
