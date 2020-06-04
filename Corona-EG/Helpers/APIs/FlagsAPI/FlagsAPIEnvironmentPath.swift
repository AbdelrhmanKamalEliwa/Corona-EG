//
//  FlagsAPIEnvironmentPath.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/4/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

struct FlagsAPIService {
    static func baseURL() -> String {
        return FlagsAPIEnvironmentPath.production.scheme() + FlagsAPIEnvironmentPath.production.host() + "/"
    }
}

enum FlagsAPIEnvironmentPath {
    
    case development
    case testing
    case production
    
    func scheme() -> String {
        switch self {
        case .development:
            return "https://"
        case .testing:
            return "https://"
        case .production:
            return "https://"
        }
    }
    
    func host() -> String {
        switch self {
        case .development:
            return "www.countryflags.io"
        case .testing:
            return "www.countryflags.io"
        case .production:
            return "www.countryflags.io"
        }
    }
    
}
