//
//  EmergencyNumbersViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/27/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class EmergencyContactsViewController: BaseViewController, EmergencyContactsView {
    
    // MARK: - Properties
    internal var presenter: EmergencyContactsViewControllerPresenter?
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupInnerScreensNavigationBar(navbarScreenTitle: .EmergencyContacts)
        presenter = EmergencyContactsViewControllerPresenter(view: self)
    }
}


// MARK: - Setup TableView
extension EmergencyContactsViewController: UITableViewDelegate, UITableViewDataSource {
    private enum Constants {
        static let nibName = "EmergencyContactsCell"
        static let cellIdentifier = "EmergencyContactsCell"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: Constants.nibName, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getContactsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! EmergencyContactsCell
        cell.selectedBackgroundView = UIColor.selectedCellBackgroundColor()
        presenter?.cellConfiguration(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = presenter?.didSelectRow(at: indexPath.row) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
