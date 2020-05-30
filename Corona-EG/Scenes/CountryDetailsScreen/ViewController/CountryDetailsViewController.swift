//
//  CountryDetailsViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import MapKit

class CountryDetailsViewController: BaseViewController, CountryDetailsView {
    
    @IBOutlet private weak var tableView: UITableView!
    internal var presenter: CountryDetailsViewControllerPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInnerScreensNavigationBar(navbarScreenTitle: nil, navbarDefaultTitle: presenter?.getCountryName() ?? "")
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
