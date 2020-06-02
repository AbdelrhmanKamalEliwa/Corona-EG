//
//  ResultScreenData.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/2/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

class ResultScreenData {
    let data: [ResultScreenDataModel] = [
        ResultScreenDataModel(title: "screen_result_title_1", description: "screen_result_description_1"),
        ResultScreenDataModel(title: "screen_result_title_2", description: "screen_result_description_2"),
        ResultScreenDataModel(title: "screen_result_title_3", description: "screen_result_description_3")
    ]
}

struct ResultScreenDataModel {
    let title: String
    let description: String
}
