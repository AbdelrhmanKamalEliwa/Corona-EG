//
//  StatisticsAPIEnvironmentPath.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

struct StatisticsAPIService {
    static func baseURL() -> String {
        return StatisticsAPIEnvironmentPath.production.scheme() + StatisticsAPIEnvironmentPath.production.host() + "/v3/stats/worldometer/country"
    }
}

enum StatisticsAPIEnvironmentPath {
    
    case development
    case testing
    case production
    
    func scheme() -> String {
        switch self {
        case .development:
            return "http://"
        case .testing:
            return "http://"
        case .production:
            return "https://"
        }
    }
    
    func host() -> String {
        switch self {
        case .development:
            return "api.coronatracker.com"
        case .testing:
            return "api.coronatracker.com"
        case .production:
            return "api.coronatracker.com"
        }
    }
    
}
