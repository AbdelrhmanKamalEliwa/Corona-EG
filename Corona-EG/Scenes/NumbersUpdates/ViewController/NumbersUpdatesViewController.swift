//
//  NumbersUpdatesViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import SVProgressHUD

class NumbersUpdatesViewController: BaseViewController {
    @IBOutlet private weak var searchBarTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    internal var presenter: NumbersUpdatesViewControllerPresenter?
    fileprivate let interactor = NumbersUpdatesInteractor()
    fileprivate let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainScreensNavigationBar(navbarTitle: .NumbersUpdatesScreen)
        setupSearchBar()
        setupRefreshController()
        setupTableView()
        presenter = NumbersUpdatesViewControllerPresenter(view: self, interactor: interactor)
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navbar.prefersLargeTitles = false
    }
}

// MARK: - Presenter Delegate
extension NumbersUpdatesViewController: NumbersUpdatesView {
    func showIndicator() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    func hideIndicator() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    func fetchDataSuccess() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showError(error: String) {
        let title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "error_title", comment: "")
        let buttonTitle = LocalizationSystem.sharedInstance.localizedStringForKey(key: "error_button", comment: "")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.presentGenericAlert(viewController: self, title: title, message: error, doneButtonTitle: buttonTitle, dismissButtonTitle: nil)
        }
    }
}

// MARK: - Setup TableView
extension NumbersUpdatesViewController: UITableViewDelegate, UITableViewDataSource {
    private enum Constants {
        static let nibName = "CountryDataTableViewCell"
        static let cellIdentifier = "CountryDataTableViewCell"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: Constants.nibName, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat((presenter?.heightForRow(at: indexPath.row)) ?? 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getCountriesCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! CountryDataTableViewCell
        cell.selectedBackgroundView = UIColor.selectedCellBackgroundColor()
        presenter?.cellConfiguration(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! CountryDataTableViewCell
//        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectRow(cell: cell, at: indexPath.row)
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.endUpdates()
    }
}

// MARK: - Setup Search Bar
extension NumbersUpdatesViewController: UISearchBarDelegate {
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.searchTextField.delegate = self
        searchBar.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "search", comment: "")
        searchBar.backgroundColor = UIColor.white
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.fetchSearch(searchText)
    }

}

// MARK: - Text Field Delegate
extension NumbersUpdatesViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

// MARK: - Animation
extension NumbersUpdatesViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableView.panGestureRecognizer.translation(in: self.view).y < 0 {
            searchBarTopConstraint.constant = 44
            navbar.isHidden = true
            UIView.animate(withDuration: 0.5) { [weak self] in self?.view.layoutIfNeeded() }
        } else {
            searchBarTopConstraint.constant = 88
            navbar.isHidden = false
            UIView.animate(withDuration: 0.5) { [weak self] in self?.view.layoutIfNeeded() }
        }
    }
}

// MARK: - Setup RefreshController
extension NumbersUpdatesViewController {
    private func setupRefreshController() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc private func refresh(_ sender: AnyObject) {
        presenter?.viewDidLoad()
        refreshControl.endRefreshing()
    }
}
