//
//  Model.swift
//  Schedule
//
//  Created by Mironov Egor production on 01.11.2024.
//

import Foundation

// MARK: - Welcome
struct News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String
}
