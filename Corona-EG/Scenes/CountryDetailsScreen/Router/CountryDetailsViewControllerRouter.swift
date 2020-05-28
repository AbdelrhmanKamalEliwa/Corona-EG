//
//  CountryDetailsViewControllerRouter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class CountryDetailsViewControllerRouter {
    private enum Constants {
        static let identifier = "CountryDetailsViewController"
    }
    
    class var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createRepoDetailsVC(countryData: CountryDataModel) -> UIViewController {
        let countryDetailsViewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.identifier)
        if let countryDetailsView = countryDetailsViewController as? CountryDetailsView {
            let presenter = CountryDetailsViewControllerPresenter(view: countryDetailsView, country: countryData)
            countryDetailsView.presenter = presenter
        }
        return countryDetailsViewController
    }
}
