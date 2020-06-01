//
//  COVID19TestInteractor.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/1/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

class COVID19TestInteractor {
    func getData(completionHandler: @escaping ([CoronaTestModel]?, Error?) -> ()) {
        let networkManager = NetworkManager()
        _ = networkManager.requestLocalJSONData(resource: "KBSDataSource") { (result: APIResult<[CoronaTestModel]>) in
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
