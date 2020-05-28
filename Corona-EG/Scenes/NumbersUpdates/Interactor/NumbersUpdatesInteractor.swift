//
//  NumbersUpdatesViewControllerInteractor.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/28/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

class NumbersUpdatesInteractor {
    func getCountriesData(completionHandler: @escaping ([CountryDataModel]?, Error?) -> ()) {
        let networkManager = NetworkManager()
        _ = networkManager.request(
            url: EndPointRouter.getCountriesData, httpMethod: .get,
        parameters: nil, headers: nil) { (result: APIResult<[CountryDataModel]>) in
            switch result {
            case .success(let data):
                completionHandler(data, nil)
            case .failure(let error):
                completionHandler(nil, error)
            case .decodingFailure(let error):
                completionHandler(nil, error)
            case .badRequest(let error):
                completionHandler(nil, error)
            }
        }
    }
}
