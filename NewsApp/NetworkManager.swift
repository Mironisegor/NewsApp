//
//  NetworkManager.swift
//  Schedule
//
//  Created by GRXXVY production on 01.11.2024.
//

import Foundation

final class NetworkManager {
    
    //MARK: Properties
    static let shared = NetworkManager()
    private let urlNews = "https://newsapi.org/v2/everything?q=tesla&from=2024-10-01&sortBy=publishedAt&apiKey=a9eae26d66b4499aabe9f54b5ac1ba6f"
    private let decoder = JSONDecoder()
    
    //MARK: Initializer
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    //MARK: Methods
    func getNews() async throws -> News {
        guard let url = URL(string: urlNews) else { throw NetworkError.invalidUrl}
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw NetworkError.invalidResponse}
        
        do {
            return try decoder.decode(News.self, from: data)
        }
        catch {
            throw NetworkError.invalidData
        }
    }
}
