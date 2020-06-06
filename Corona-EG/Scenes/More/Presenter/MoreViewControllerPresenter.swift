//
//  MoreViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

// MARK: - More View Protocol
protocol MoreView: class {
    var presenter: MoreViewControllerPresenter? { get set }
    func presentAboutUsView()
}

// MARK: - More Cell View Protocol
protocol MoreCellView {
    func displayScreenIcon(_ iconName: String)
    func displayScreenTitle(_ title: String)
}

class MoreViewControllerPresenter {
    
    // MARK: - Properties
    private weak var view: MoreView?
    private let router: MoreRouter
    private let screens = MoreScreensData().data
    
    // MARK: - init
    init(view: MoreView?, router: MoreRouter) {
        self.view = view
        self.router = router
    }
    
    // MARK: - Methods
    func getScreenCount() -> Int {
        screens.count
    }
    
    func cellConfiguartion(cell: MoreCellView, for index: Int) {
        let screen = screens[index]
        let icon = screen.iconName
        cell.displayScreenIcon(icon)
        let title = screen.screenTitle.localizedString()
        cell.displayScreenTitle(title)
    }
    
    func didSelectRow(at index: Int) {
        let screen = MoreScreensCases(rawValue: index)
        switch screen {
        case .InfectionMethods:
            router.navigateToInfectionMethodsScreen(from: view)
        case .PreventionTips:
            router.navigateToPreventionTipsScreen(from: view)
        case .EmergencyContacts:
            router.navigateToEmergencyContactsScreen(from: view)
        case .AboutUs:
            view?.presentAboutUsView()
        case .none:
            break
        }
    }
}
