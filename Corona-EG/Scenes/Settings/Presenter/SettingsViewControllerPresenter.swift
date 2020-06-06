//
//  SettingsViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/2/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

// MARK: - Settings View Protocol
protocol SettingsView: class {
    var presenter: SettingsViewControllerPresenter? { get set }
    func changeCurrentLanguage(_ languageTitle: String, _ languageMessage: String, _ doneButtonTitle: String, _ cancelButtonTitle: String)
    func displayScreenNavBar(_ title: String, buttonTitle: String)
    func goToWebsite()
}

// MARK: - Settings Cell View Protocol
protocol SettingsCellView {
    func displaySettingIcon(_ iconName: String)
    func displaySettingTitle(_ title: String)
}

class SettingsViewControllerPresenter {
    
    // MARK: - Properties
    private weak var view: SettingsView?
    private let settings = SettingsScreenTitles().titles
    
    // MARK: - init
    init(view: SettingsView?) {
        self.view = view
    }
    
    // MARK: - Methods
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
        let title = setting.title.localizedString()
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
        return "settings_screen_title".localizedString()
    }
    
    private func buttonTitle() -> String {
        return "settings_screen_done_button_title".localizedString()
    }
    
    private func getLanguageTitle() -> String {
        return "change_language_title".localizedString()
    }
    
    private func getLanguageMessage() -> String {
        return "change_language_message".localizedString()
    }
    
    private func getDoneButtonTitle() -> String {
        return "chnage_language_done_button_title".localizedString()
    }
    
    private func getCancelButtonTitle() -> String {
        return "chnage_language_cancel_button_title".localizedString()
    }
}
