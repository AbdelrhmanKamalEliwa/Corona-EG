//
//  NumbersUpdatesViewControllerRouter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class NumbersUpdatesViewControllerRouter {
//    private enum Constants {
//        static let identifier = "NumbersUpdatesViewController"
//    }
//    
//    class var mainStoryboard: UIStoryboard {
//        return UIStoryboard(name: "Main", bundle: Bundle.main)
//    }
    
//    class func createNumbersUpdatesViewController() -> UIViewController {
//        let numbersUpdatesViewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.identifier)
//        let interactor = NumbersUpdatesInteractor()
//        let router = NumbersUpdatesViewControllerRouter()
//        if let numbersUpdatesView = numbersUpdatesViewController as? NumbersUpdatesView {
//            let presenter = NumbersUpdatesViewControllerPresenter(view: numbersUpdatesView, interactor: interactor, router: router)
//            numbersUpdatesView.presenter = presenter
//        }
//        return numbersUpdatesViewController
//    }
    
    func navigateToCountryDetailsScreen(from view: NumbersUpdatesView?, countryData: CountryDataModel) {
        let countryDetailsView = CountryDetailsViewControllerRouter.createRepoDetailsVC(countryData: countryData)
        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(countryDetailsView, animated: true)
        }
    }
}
