//
//  InfectionMethodsViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/29/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class InfectionMethodsViewController: BaseViewController, InfectionMethodsView {
    
    internal var presenter: InfectionMethodsViewControllerPresenter?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = InfectionMethodsViewControllerPresenter(view: self)
        setupInnerScreensNavigationBar(navbarScreenTitle: .InfectionMethods)
        setupTableView()
    }
}


// MARK: - Setup TableView
extension InfectionMethodsViewController: UITableViewDelegate, UITableViewDataSource {
    private enum Constants {
        static let nibName = "InfectionMethodCell"
        static let cellIdentifier = "InfectionMethodCell"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! InfectionMethodCell
        cell.selectedBackgroundView = UIColor.selectedCellBackgroundColor()
        presenter?.cellConfiguartion(cell: cell, for: indexPath.row)
        return cell
    }
    
}
