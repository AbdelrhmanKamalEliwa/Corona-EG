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
    func changeCurrentLanguage(_ languageTitle: String, _ languageMessage: String, _ doneButtonTitle: String, _ cancelButtonTitle: String)
    func displayScreenNavBar(_ title: String, buttonTitle: String)
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
    
    func viewDidLoad() {
        view?.displayScreenNavBar(screenTitle(), buttonTitle: buttonTitle())
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
            view?.changeCurrentLanguage(
                getLanguageTitle(),
                getLanguageMessage(),
                getDoneButtonTitle(),
                getCancelButtonTitle())
        case .GoToWebsite:
            view?.goToWebsite()
        case .none:
            break
        }
    }
    
    private func screenTitle() -> String {
        return LocalizationSystem.sharedInstance.localizedStringForKey(key: "settings_screen_title", comment: "")
    }
    
    private func buttonTitle() -> String {
        return LocalizationSystem.sharedInstance.localizedStringForKey(key: "settings_screen_done_button_title", comment: "")
    }
    
    private func getLanguageTitle() -> String {
        return LocalizationSystem.sharedInstance.localizedStringForKey(key: "change_language_title", comment: "")
    }
    
    private func getLanguageMessage() -> String {
        return LocalizationSystem.sharedInstance.localizedStringForKey(key: "change_language_message", comment: "")
    }
    
    private func getDoneButtonTitle() -> String {
        return LocalizationSystem.sharedInstance.localizedStringForKey(key: "chnage_language_done_button_title", comment: "")
    }
    
    private func getCancelButtonTitle() -> String {
        return LocalizationSystem.sharedInstance.localizedStringForKey(key: "chnage_language_cancel_button_title", comment: "")
    }
}
