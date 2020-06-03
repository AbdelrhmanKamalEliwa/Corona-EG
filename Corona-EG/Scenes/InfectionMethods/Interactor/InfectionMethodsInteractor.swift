//
//  InfectionMethodsInteractor.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/3/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

class InfectionMethodsInteractor {
    func getData(completionHandler: @escaping ([InfectionMethodsModel]?, Error?) -> ()) {
        let networkManager = NetworkManager()
        _ = networkManager.requestLocalJSONData(resource: "InfectionMethodsDataSource") { (result: APIResult<[InfectionMethodsModel]>) in
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
