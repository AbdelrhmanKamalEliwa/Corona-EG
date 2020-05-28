//
//  CountryDetailsViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import MapKit

class CountryDetailsViewController: UIViewController, CountryDetailsView {
    
    @IBOutlet private weak var tableView: UITableView!
    internal var presenter: CountryDetailsViewControllerPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }
    
    @IBAction func showOnMapButtonTapped(_ sender: Any) {
        let lat = presenter?.getLatitude() ?? 0
        let lng = presenter?.getLongitude() ?? 0
        let destination = presenter?.getCountryName()
        showOnMap(lat: lat, lng: lng, destinationName: destination)
    }
    
    func showOnMap(lat: Double, lng: Double, destinationName: String?) {
        let destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng)))
        destination.name = destinationName
        MKMapItem.openMaps(with: [destination], launchOptions: [:])
    }
}

// MARK: - Custom Navigation Bar
extension CountryDetailsViewController {
    func setupNavigationBar() {
        let navbar = navigationController!.navigationBar
        navbar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navbar.shadowImage = UIImage()
        navbar.barStyle = UIBarStyle.default
        navigationItem.title = presenter?.getCountryName()
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.defaultFont(20, .Bold),
            .foregroundColor: UIColor.navbarTitleColor
        ]
        navbar.titleTextAttributes = titleAttributes
        
        // MARK: Letf Button
        let leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .done, target: self,
            action: #selector(leftSideBarButtonItemTapped(_:)))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.navbarButtonColor
        
    }
    
    @objc func leftSideBarButtonItemTapped(_ sender: UIBarButtonItem!) {
        self.navigationController?.popViewController(animated: true)
    }
}


// MARK: - Setup TableView
extension CountryDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    private enum Constants {
        static let nibName = "CounrtyDetailsCell"
        static let cellIdentifier = "CounrtyDetailsCell"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: Constants.nibName, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRowsInSection() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! CounrtyDetailsCell
        presenter?.cellConfiguration(cell: cell, forSection: indexPath.section, forIndex: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        presenter?.sectionTitle(for: section)
    }
}
