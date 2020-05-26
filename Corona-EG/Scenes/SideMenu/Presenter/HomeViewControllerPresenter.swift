//
//  HomeViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/26/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

protocol HomeTableView: class {
    var presenter: HomeViewControllerPresenter? { get set }
}

protocol HomeCellView {
    func displayItemIcon(_ iconName: String)
    func displayItemLabel(_ itemName: String)
}


class HomeViewControllerPresenter {
    private weak var view: HomeTableView?
    private let items = SideMenuItems().items
    
    init(view: HomeTableView?) {
        self.view = view
    }
    
    func getSideMenuItemsCount() -> Int {
        items.count
    }
    
    func cellConfigutation(cell: HomeCellView, for index: Int) {
        let item = items[index]
        
        let itemName = LocalizationSystem.sharedInstance.localizedStringForKey(key: item.itemName, comment: "")
        cell.displayItemLabel(itemName)
        
        let itemIcon = LocalizationSystem.sharedInstance.localizedStringForKey(key: item.itemIcon, comment: "")
        cell.displayItemIcon(itemIcon)
    }
    
    func didSelectRow(at index: Int) {
        
    }
}
