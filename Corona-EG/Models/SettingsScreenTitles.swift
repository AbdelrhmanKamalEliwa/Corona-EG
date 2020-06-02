//
//  SettingsScreenTitles.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/2/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

class SettingsScreenTitles {
    let titles: [ScreenTitle] = [
        ScreenTitle(title: "change_language", iconName: "change-language-icon"),
        ScreenTitle(title: "website", iconName: "website-icon")
    ]
}

struct ScreenTitle {
    let title: String
    let iconName: String
}
