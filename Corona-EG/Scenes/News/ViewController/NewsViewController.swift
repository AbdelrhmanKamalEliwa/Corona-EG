//
//  ViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/24/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import SafariServices
import SVProgressHUD

class NewsViewController: BaseViewController {
    
    // MARK: - Properties
    @IBOutlet private weak var tableViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var tableView: UITableView!
    fileprivate let refreshControl = UIRefreshControl()
    internal var presenter: NewsViewControllerPresenter?
    
    // MARK: - Life Cycle
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
            SVProgressHUD.show()
        }
    }
    
    func hideIndicator() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    func fetchDataSuccess() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showError(error: String) {
        let title = "error_title".localizedString()
        let buttonTitle = "error_button".localizedString()
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.presentGenericAlert(viewController: self, title: title, message: error, doneButtonTitle: buttonTitle, dismissButtonTitle: nil)
        }
    }
}

// MARK: - Setup TableView
extension NewsViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    private enum Constants {
        static let nibName = "NewsCell"
        static let cellIdentifier = "NewsCell"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
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
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if indexPath.row == (presenter?.getNewsCount() ?? 0) - 1 {
//                presenter?.viewDidLoad()
            }
        }
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
//        presenter?.viewDidLoad()
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
