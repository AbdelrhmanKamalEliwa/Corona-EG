//
//  CountyDataModel.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

struct CountryDataModel: Codable {
    let countryCode: String?
    let country: String?
    let lat: Double?
    let lng: Double?
    let totalConfirmed: Int?
    let totalDeaths: Int?
    let totalRecovered: Int?
    let dailyConfirmed: Int?
    let dailyDeaths: Int?
    let activeCases: Int?
    let totalCritical: Int?
}
