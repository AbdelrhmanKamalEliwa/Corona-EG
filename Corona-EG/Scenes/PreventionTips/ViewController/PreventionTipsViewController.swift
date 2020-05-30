//
//  PreventionTipsViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class PreventionTipsViewController: UIViewController, PreventionTipsView {
    var presenter: PreventionTipsViewControllerPresenter?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PreventionTipsViewControllerPresenter(view: self)
        setupTableView()
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
        presenter?.cellConfiguartion(cell: cell, for: indexPath.row)
        return cell
    }
    
}
