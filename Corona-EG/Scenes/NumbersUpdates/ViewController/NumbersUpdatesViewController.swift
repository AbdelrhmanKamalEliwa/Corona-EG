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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(navbarTitle: "side_menu_item_2")
        setupSideMenu(view: self.view)
        setupCollectionView()
        setupSearchBar()
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
        print(error)
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
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 319, height: 280)
    }
}

// MARK: - Setup Search Bar
extension NumbersUpdatesViewController: UISearchBarDelegate {
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.searchTextField.delegate = self
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
            searchBar.isHidden = true
            UIView.animate(withDuration: 0.5) { self.view.layoutIfNeeded() }
        } else {
            collectionViewTopConstraint.constant = 50
            navbar.isHidden = false
            searchBar.isHidden = false
            UIView.animate(withDuration: 0.5) { self.view.layoutIfNeeded() }
        }
    }
}
