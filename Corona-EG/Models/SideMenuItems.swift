//
//  SideMenuItems.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/26/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

class SideMenuItems {
    let items: [Item] = [
        Item(itemName: "side_menu_item_1", itemIcon: "news"),
        Item(itemName: "side_menu_item_2", itemIcon: "numbers-updates"),
        Item(itemName: "side_menu_item_3", itemIcon: "infection-methods"),
        Item(itemName: "side_menu_item_4", itemIcon: "prevention-tips"),
        Item(itemName: "side_menu_item_5", itemIcon: "covid-19-test"),
        Item(itemName: "side_menu_item_6", itemIcon: "emergency-numbers")
    ]
}

struct Item {
    let itemName: String
    let itemIcon: String
}
