//
//  ViewController.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/24/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var changeLanguageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupSideMenu()
        changeLanguageButton.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "change_language", comment: ""), for: .normal)
    }
    
    @IBAction func changeLanguageButtonTapped(_ sender: UIButton) {
        changeLanguage()
    }
    
}

//MARK: - SetupTableView
//extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}

