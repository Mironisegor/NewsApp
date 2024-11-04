//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Egor Mironov on 04.11.2024.
//

import Foundation

final class NetworkManager {
    
    //MARK: Properties
    static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    
    //MARK: Initializer
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    //MARK: Methods
    func getNews(urlString: String) async throws -> Welcome {
        guard let url = URL(string: urlString) else { throw NetworkError.invalidUrl}
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw NetworkError.invalidResponse}
        
        do {
            return try decoder.decode(Welcome.self, from: data)
        }
        catch {
            throw NetworkError.invalidData
        }
    }
}
