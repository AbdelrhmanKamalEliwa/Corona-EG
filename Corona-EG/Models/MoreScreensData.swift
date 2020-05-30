//
//  MoreScreensData.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/30/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

class MoreScreensData {
    let data: [ScreenData] = [
        ScreenData(iconName: "infection-methods", screenTitle: "infection_methods"),
        ScreenData(iconName: "prevention-tips", screenTitle: "prevention_tips"),
        ScreenData(iconName: "emergency-numbers", screenTitle: "emergency_contacts"),
        ScreenData(iconName: "contact-us", screenTitle: "contact_us"),
        ScreenData(iconName: "about-us", screenTitle: "about_us")
    ]
}

struct ScreenData {
    let iconName: String
    let screenTitle: String
}
