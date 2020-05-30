//
//  MoreViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class MoreViewController: BaseViewController, MoreView {
    
    @IBOutlet private weak var tableView: UITableView!
    internal var presenter: MoreViewControllerPresenter?
    fileprivate let router = MoreRouter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MoreViewControllerPresenter(view: self, router: router)
        setupMainScreensNavigationBar(navbarTitle: .More)
        setupTableView()
    }
}


// MARK: - Setup TableView
extension MoreViewController: UITableViewDelegate, UITableViewDataSource {
    private enum Constants {
        static let nibName = "MoreViewCell"
        static let cellIdentifier = "MoreViewCell"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: Constants.nibName, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getScreenCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MoreViewCell
        presenter?.cellConfiguartion(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath.row)
    }
}
