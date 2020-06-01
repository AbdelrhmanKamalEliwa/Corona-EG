//
//  CoronaTestModel.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/1/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

struct CoronaTestModel: Codable {
    let language: String
    let data: [Question]
}

struct Question: Codable {
    let question: String
    let answer: [Answer]
}

struct Answer: Codable {
    let answer: String
    let value: Int
}
