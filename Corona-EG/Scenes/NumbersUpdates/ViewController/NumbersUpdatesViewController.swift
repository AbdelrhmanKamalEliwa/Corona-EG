//
//  NumbersUpdatesViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import SKActivityIndicatorView

class NumbersUpdatesViewController: BaseViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var collectionViewTopConstraint: NSLayoutConstraint!
    internal var presenter: NumbersUpdatesViewControllerPresenter?
    fileprivate let interactor = NumbersUpdatesInteractor()
    fileprivate let router = NumbersUpdatesViewControllerRouter()
    fileprivate let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainScreensNavigationBar(navbarTitle: .NumbersUpdatesScreen)
        setupCollectionView()
        setupSearchBar()
        setupRefreshController()
        presenter = NumbersUpdatesViewControllerPresenter(view: self, interactor: interactor, router: router)
        presenter?.viewDidLoad()
    }
}

// MARK: - Presenter Delegate
extension NumbersUpdatesViewController: NumbersUpdatesView {
    func showIndicator() {
        DispatchQueue.main.async {
            SKActivityIndicator.show()
        }
    }
    
    func hideIndicator() {
        DispatchQueue.main.async {
            SKActivityIndicator.dismiss()
        }
    }
    
    func fetchDataSuccess() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func showError(error: String) {
        let title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "error_title", comment: "")
        let buttonTitle = LocalizationSystem.sharedInstance.localizedStringForKey(key: "error_button", comment: "")
        DispatchQueue.main.async {
            self.presentGenericAlert(viewController: self, title: title, message: error, buttonTitle: buttonTitle)
        }
    }
}

// MARK: - Setup CollectionView
extension NumbersUpdatesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private enum Constants {
        static let nibName = "CountryDataCell"
        static let cellIdentifier = "CountryDataCell"
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            UINib.init(nibName: Constants.nibName, bundle: nil),
            forCellWithReuseIdentifier: Constants.cellIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.getCountriesCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as! CountryDataCell
        presenter?.cellConfiguration(cell: cell, for: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath.item)
        navbar.isHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 319, height: 280)
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
        if collectionView.panGestureRecognizer.translation(in: self.view).y < 0 {
            collectionViewTopConstraint.constant = 0
            navbar.isHidden = true
            UIView.animate(withDuration: 0.5) { self.view.layoutIfNeeded() }
        } else {
            collectionViewTopConstraint.constant = 50
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
        collectionView.addSubview(refreshControl)
    }
    
    @objc private func refresh(_ sender: AnyObject) {
        presenter?.viewDidLoad()
        refreshControl.endRefreshing()
    }
}
