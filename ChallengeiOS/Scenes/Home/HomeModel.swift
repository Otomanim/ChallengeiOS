//
//  HomeModel.swift
//  ChallengeiOS
//
//  Created by Evandro Rodrigo Minamoto on 11/05/24.
//

import Foundation

struct Source: Decodable {
    let id: String?
    let name: String
}

struct Article: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
