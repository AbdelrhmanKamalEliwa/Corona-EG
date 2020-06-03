//
//  PreventionTipsModel.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/3/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

struct PreventionTipsModel: Codable {
    let language: String
    let data: [PreventionTip]
}

struct PreventionTip: Codable {
    let tip: String
}
