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
    
    // MARK: - Properties
    internal var presenter: SettingsViewControllerPresenter?
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var doneButton: UIButton!
    @IBOutlet private weak var screenTitle: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SettingsViewControllerPresenter(view: self)
        presenter?.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Methods
    @IBAction private func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Presenter Delegate
extension SettingsViewController: SettingsView {
    func displayScreenNavBar(_ title: String, buttonTitle: String) {
        screenTitle.text = title
        doneButton.setTitle(buttonTitle, for: .normal)
        screenTitle.textColor = UIColor.mainColor
        doneButton.tintColor = .lightGray
        doneButton.backgroundColor = UIColor.mainColor
    }
    
    func changeCurrentLanguage(_ languageTitle: String, _ languageMessage: String, _ doneButtonTitle: String, _ cancelButtonTitle: String) {
        presentGenericAlert(viewController: self, title: languageTitle, message: languageMessage, doneButtonTitle: doneButtonTitle, dismissButtonTitle: cancelButtonTitle) { (_) in
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
