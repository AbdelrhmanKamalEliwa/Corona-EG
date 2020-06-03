//
//  InfectionMethodsModel.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 6/3/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

struct InfectionMethodsModel: Codable {
    let language: String
    let data: [InfectionMethodQuestion]
}

struct InfectionMethodQuestion: Codable {
    let question: String
    let answer: String
}
