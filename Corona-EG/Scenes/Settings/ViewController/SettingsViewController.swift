//
//  SettingsViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/2/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import SafariServices

class SettingsViewController: BaseViewController {
    internal var presenter: SettingsViewControllerPresenter?
    @IBOutlet private weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SettingsViewControllerPresenter(view: self)
        setupTableView()
    }
}

// MARK: - Presenter Delegate
extension SettingsViewController: SettingsView {
    func changeCurrentLanguage() {
        let changeLanguageTitle = LocalizationSystem.sharedInstance.localizedStringForKey(key: "change_language_title", comment: "")
        let changeLanguageMessage = LocalizationSystem.sharedInstance.localizedStringForKey(key: "change_language_message", comment: "")
        let doneButtonTitle = LocalizationSystem.sharedInstance.localizedStringForKey(key: "chnage_language_done_button_title", comment: "")
        let cancelButtonTitle = LocalizationSystem.sharedInstance.localizedStringForKey(key: "chnage_language_cancel_button_title", comment: "")
        presentGenericAlert(viewController: self, title: changeLanguageTitle, message: changeLanguageMessage, doneButtonTitle: doneButtonTitle, dismissButtonTitle: cancelButtonTitle) { (_) in
            self.changeLanguage()
        }
    }
    
    func goToWebsite() {
        let webViewController = SFSafariViewController(url: EndPointRouter.website)
        present(webViewController, animated: true, completion: nil)
    }
}

// MARK: - Setup TableView
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    private enum Constants {
        static let nibName = "SettingsCell"
        static let cellIdentifier = "SettingsCell"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: Constants.nibName, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getSettingsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! SettingsCell
        cell.selectedBackgroundView = UIColor.selectedCellBackgroundColor()
        presenter?.cellConfiguartion(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath.row)
    }
}
