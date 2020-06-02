//
//  ViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/24/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import SKActivityIndicatorView
import SafariServices

class NewsViewController: BaseViewController {
    
    @IBOutlet private weak var tableViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var tableView: UITableView!
    fileprivate let refreshControl = UIRefreshControl()
    internal var presenter: NewsViewControllerPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainScreensNavigationBar(navbarTitle: .NewsScreen)
        setupTableView()
        setupRefreshController()
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

// MARK: - Setup TableView
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    private enum Constants {
        static let nibName = "NewsCell"
        static let cellIdentifier = "NewsCell"
    }
    
    private func setupTableView() {
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
        cell.selectedBackgroundView = UIColor.selectedCellBackgroundColor()
        presenter?.cellConfiguartion(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = presenter?.didSelectRow(at: indexPath.row)
        let webViewController = SFSafariViewController(url: url!)
        present(webViewController, animated: true, completion: nil)
    }
}

// MARK: - Setup RefreshController
extension NewsViewController {
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

// MARK: - Animation
extension NewsViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableView.panGestureRecognizer.translation(in: self.view).y < 0 {
            tableViewTopConstraint.constant = 44
            navbar.isHidden = true
            UIView.animate(withDuration: 0.5) { self.view.layoutIfNeeded() }
        } else {
            tableViewTopConstraint.constant = 88
            navbar.isHidden = false
            UIView.animate(withDuration: 0.5) { self.view.layoutIfNeeded() }
        }
    }
}
