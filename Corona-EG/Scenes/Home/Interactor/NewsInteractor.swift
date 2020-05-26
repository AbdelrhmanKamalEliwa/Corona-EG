//
//  NewsInteractor.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/26/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

class NewsInteractor {
    
    func getNews(country: Countries, completionHandler: @escaping ([Article]?, Error?) -> ()) {
        
        let networkManager = NetworkManager()
        _ = networkManager.request(
            url: EndPointRouter.getNews(country: country), httpMethod: .get,
        parameters: nil, headers: nil) { (result: APIResult<[Article]>) in
            
            switch result {
            case .success(let data):
                print(data)
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
