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
        return StatisticsAPIEnvironmentPath.development.scheme() + StatisticsAPIEnvironmentPath.development.host() + "/v3/stats/worldometer/country"
    }
}

enum StatisticsAPIEnvironmentPath {
    
    case development
    case testing
    case production
    
    func scheme() -> String {
        switch self {
        case .development:
            return "https://"
        case .testing:
            return ""
        case .production:
            return ""
        }
    }
    
    func host() -> String {
        switch self {
        case .development:
            return "api.coronatracker.com"
        case .testing:
            return ""
        case .production:
            return ""
        }
    }
    
}
