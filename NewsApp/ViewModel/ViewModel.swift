//
//  ViewModel.swift
//  NewsApp
//
//  Created by Vladimir Fursov on 04.11.2024.
//

import Foundation

@MainActor
final class ViewModel: ObservableObject {
    //MARK: Properties
    @Published var topNews: [Article]  = []
    @Published var otherNews: [Article] = []
    
    init() {
        fetchTopNews()
        fetchOtherNews()
    }
    
    //MARK: Methods
    func fetchTopNews(){
        Task {
            do {
                let articles = try await NetworkManager.shared.getNews(urlString: UrlConstants.topNewsUrl)
                topNews = articles.articles
            }
            catch {
                if let error = error as? NetworkError {
                    print(error)
                }
            }
        }
    }
    
    func fetchOtherNews(){
        Task {
            do {
                let articles = try await NetworkManager.shared.getNews(urlString: UrlConstants.otherNewsUrl)
                otherNews = articles.articles
            }
            catch {
                if let error = error as? NetworkError {
                    print(error)
                }
            }
        }
    }
}
