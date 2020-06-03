//
//  PreventionTipsInteractor.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/3/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

class PreventionTipsInteractor {
    func getData(completionHandler: @escaping ([PreventionTipsModel]?, Error?) -> ()) {
        let networkManager = NetworkManager()
        _ = networkManager.requestLocalJSONData(resource: "PreventionTipsDataSource") { (result: APIResult<[PreventionTipsModel]>) in
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
