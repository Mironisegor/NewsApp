//
//  Model.swift
//  NewsApp
//
//  Created by Egor Mironov on 04.11.2024.
//

import Foundation

// MARK: - Welcome
struct Welcome: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let author: String?
    let title: String?
    let description: String
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String
}
