//
//  PreventionTipsViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class PreventionTipsViewController: BaseViewController {
    internal var presenter: PreventionTipsViewControllerPresenter?
    fileprivate let interactor = PreventionTipsInteractor()
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PreventionTipsViewControllerPresenter(view: self, interactor: interactor)
        setupInnerScreensNavigationBar(navbarScreenTitle: .PreventionTips)
        setupTableView()
        presenter?.viewDidLoad()
    }
}

// MARK: - Presenter Delegate
extension PreventionTipsViewController: PreventionTipsView {
    func showError(_ error: String) {
        let title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "error_title", comment: "")
        let buttonTitle = LocalizationSystem.sharedInstance.localizedStringForKey(key: "error_button", comment: "")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.presentGenericAlert(viewController: self, title: title, message: error, doneButtonTitle: buttonTitle, dismissButtonTitle: nil)
        }
    }
}

// MARK: - Setup TableView
extension PreventionTipsViewController: UITableViewDelegate, UITableViewDataSource {
    private enum Constants {
        static let nibName = "PreventionTipsCell"
        static let cellIdentifier = "PreventionTipsCell"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: Constants.nibName, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getMethodsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! PreventionTipsCell
        cell.selectedBackgroundView = UIColor.selectedCellBackgroundColor()
        presenter?.cellConfiguartion(cell: cell, for: indexPath.row)
        return cell
    }
}
