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
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionViewTopConstraint: NSLayoutConstraint!
    
    var presenter: NumbersUpdatesViewControllerPresenter?
    fileprivate let interactor = NumbersUpdatesInteractor()
    fileprivate let router = NumbersUpdatesViewControllerRouter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(navbarTitle: "side_menu_item_2")
        setupSideMenu()
        setupCollectionView()
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
    enum Constants {
        static let nibName = "CountryDataCell"
        static let cellIdentifier = "CountryDataCell"
    }
    
    func setupCollectionView() {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

//        let noOfCellsInRow = 1   //number of column you want
//        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
//        let totalSpace = flowLayout.sectionInset.left
//            + flowLayout.sectionInset.right
//            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
//
//        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: 319, height: 280)
    }
}
