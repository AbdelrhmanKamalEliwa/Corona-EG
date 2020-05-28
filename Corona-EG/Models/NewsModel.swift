//
//  NewsModel.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/26/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

struct NewsModel: Codable {
    let status: String
    let articles: [Article]
}

struct Article: Codable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}
