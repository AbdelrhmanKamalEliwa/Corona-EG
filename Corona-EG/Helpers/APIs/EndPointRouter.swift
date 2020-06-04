//
//  EndPointRouter.swift
//  Feshar
//
//  Created by Abdelrhman Eliwa on 4/7/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

struct EndPointRouter {
    static var getNews: URL { return URL(string: NewsAPIService.baseURL())! }
    
    static func getNews(country: Countries, at page: Int) -> URL {
        return URL(string: NewsAPIService.baseURL() +
            "&page=" + String(abs(page)) + "&pageSize=20" + "&country=" + country.rawValue + "&category=health")!
    }
    
    static var getCountriesData: URL {
        return URL(string: StatisticsAPIService.baseURL())!
    }
    
    static var website: URL {
        return URL(string: "https://corona-eg.firebaseapp.com/")!
    }
    
    static func getCountryFlag(countryCode: String) -> URL {
        return URL(string: FlagsAPIService.baseURL() + countryCode + "/flat/64.png")!
    }
}
