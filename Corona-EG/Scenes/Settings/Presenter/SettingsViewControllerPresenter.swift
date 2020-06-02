//
//  SettingsViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/2/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

protocol SettingsView: class {
    var presenter: SettingsViewControllerPresenter? { get set }
    func changeCurrentLanguage()
    func goToWebsite()
}

protocol SettingsCellView {
    func displaySettingIcon(_ iconName: String)
    func displaySettingTitle(_ title: String)
}

class SettingsViewControllerPresenter {
    private weak var view: SettingsView?
    private let settings = SettingsScreenTitles().titles
    
    init(view: SettingsView?) {
        self.view = view
    }
    
    func getSettingsCount() -> Int {
        settings.count
    }
    
    func cellConfiguartion(cell: SettingsCellView, for index: Int) {
        let setting = settings[index]
        let icon = setting.iconName
        cell.displaySettingIcon(icon)
        let title = LocalizationSystem.sharedInstance.localizedStringForKey(key: setting.title, comment: "")
        cell.displaySettingTitle(title)
    }
    
    func didSelectRow(at index: Int) {
        let settingsScreenCase = SettingScreenCases(rawValue: index)
        switch settingsScreenCase {
        case .ChangeLanguage:
            view?.changeCurrentLanguage()
        case .GoToWebsite:
            view?.goToWebsite()
        case .none:
            break
        }
    }
}
