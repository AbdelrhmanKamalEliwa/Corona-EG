//
//  HomeViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/26/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

protocol MenuTableView: class {
    var presenter: MenuListControllerPresenter? { get set }
}

protocol MenuCellView {
    func displayItemIcon(_ iconName: String)
    func displayItemLabel(_ itemName: String)
}


class MenuListControllerPresenter {
    private weak var view: MenuTableView?
    private let items = SideMenuItems().items
    
    init(view: MenuTableView?) {
        self.view = view
    }
    
    func getSideMenuItemsCount() -> Int {
        items.count
    }
    
    func cellConfigutation(cell: MenuCellView, for index: Int) {
        let item = items[index]
        
        let itemName = LocalizationSystem.sharedInstance.localizedStringForKey(key: item.itemName, comment: "")
        cell.displayItemLabel(itemName)
        
        let itemIcon = LocalizationSystem.sharedInstance.localizedStringForKey(key: item.itemIcon, comment: "")
        cell.displayItemIcon(itemIcon)
    }
    
    func didSelectRow(at index: Int) {
        
    }
}
