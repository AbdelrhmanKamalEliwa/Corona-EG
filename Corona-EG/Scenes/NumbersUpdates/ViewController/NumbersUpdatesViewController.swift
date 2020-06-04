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
    
    var selectedIndex = -1
    var isCollapce = false
    
    @IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchBar: UISearchBar!
//    @IBOutlet private weak var collectionViewTopConstraint: NSLayoutConstraint!
    internal var presenter: NumbersUpdatesViewControllerPresenter?
    fileprivate let interactor = NumbersUpdatesInteractor()
    fileprivate let router = NumbersUpdatesViewControllerRouter()
    fileprivate let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainScreensNavigationBar(navbarTitle: .NumbersUpdatesScreen)
//        setupCollectionView()
        setupSearchBar()
        setupRefreshController()
        presenter = NumbersUpdatesViewControllerPresenter(view: self, interactor: interactor, router: router)
        presenter?.viewDidLoad()
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableView.automaticDimension
        setupTableView()
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
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(error: String) {
        let title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "error_title", comment: "")
        let buttonTitle = LocalizationSystem.sharedInstance.localizedStringForKey(key: "error_button", comment: "")
        DispatchQueue.main.async {
            self.presentGenericAlert(viewController: self, title: title, message: error, doneButtonTitle: buttonTitle, dismissButtonTitle: nil)
        }
    }
}

// MARK: - Setup CollectionView
//extension NumbersUpdatesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    private enum Constants {
//        static let nibName = "CountryDataCell"
//        static let cellIdentifier = "CountryDataCell"
//    }
//
//    private func setupCollectionView() {
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(
//            UINib.init(nibName: Constants.nibName, bundle: nil),
//            forCellWithReuseIdentifier: Constants.cellIdentifier)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        presenter?.getCountriesCount() ?? 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as! CountryDataCell
//        presenter?.cellConfiguration(cell: cell, for: indexPath.item)
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        presenter?.didSelectRow(at: indexPath.item)
//        navbar.isHidden = false
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 319, height: 280)
//    }
//}

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
            tableViewTopConstraint.constant = 0
            navbar.isHidden = true
            UIView.animate(withDuration: 0.5) { self.view.layoutIfNeeded() }
        } else {
            tableViewTopConstraint.constant = 50
            navbar.isHidden = false
            UIView.animate(withDuration: 0.5) { self.view.layoutIfNeeded() }
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
        CGFloat((presenter?.heightForRow(at: indexPath.row)) ?? 0)
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
//        let url = presenter?.didSelectRow(at: indexPath.row)
//        let webViewController = SFSafariViewController(url: url!)
//        present(webViewController, animated: true, completion: nil)
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! CountryDataTableViewCell
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectRow(cell: cell, at: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
