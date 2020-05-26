//
//  EndPointRouter.swift
//  Feshar
//
//  Created by Abdelrhman Eliwa on 4/7/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

struct EndPointRouter {
    static var getNews: URL { return URL(string: APIService.baseURL())! }
    
    static func getNews(country: Countries) -> URL {
        return URL(string: APIService.baseURL() + "&country=" + country.rawValue + "&category=health")!
    }
}
