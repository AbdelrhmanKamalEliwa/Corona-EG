//
//  APIEnvironmentPath.swift
//  Feshar
//
//  Created by Abdelrhman Eliwa on 4/7/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

struct NewsAPIService {
    static func baseURL() -> String {
        return NewsAPIEnvironmentPath.development.scheme() + NewsAPIEnvironmentPath.development.host() + "/v2/top-headlines?apiKey=" + NewsAPIEnvironmentPath.development.apiKey()
    }
}

enum NewsAPIEnvironmentPath {
    
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
            return "newsapi.org"
        case .testing:
            return ""
        case .production:
            return ""
        }
    }
    
    func apiKey() -> String {
        switch self {
        case .development:
            return "ea66210c1d70444bac81823333127c8d"
        case .testing:
            return ""
        case .production:
            return ""
        }
    }
    
}
