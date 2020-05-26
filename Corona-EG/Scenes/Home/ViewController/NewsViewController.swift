//
//  ViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/24/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import SideMenu
import SKActivityIndicatorView

class NewsViewController: BaseViewController {
    
    var presenter: NewsViewControllerPresenter?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSideMenu()
        setupTableView()
        presenter = NewsViewControllerPresenter(view: self, interactor: NewsInteractor())
        presenter?.viewDidLoad()
    }
    
}


// MARK: - Presenter Delegate
extension NewsViewController: NewsView {
    
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
        tableView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
    
}


// MARK: - Setup TableView
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    enum Constants {
        static let nibName = "NewsCell"
        static let cellIdentifier = "NewsCell"
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: Constants.nibName, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getNewsCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! NewsCell
        presenter?.cellConfiguartion(cell: cell, for: indexPath.row)
        return cell
    }

}
