//
//  CellOfTopNews.swift
//  NewsApp
//
//  Created by Vladimir Fursov on 04.11.2024.
//

import Foundation
import SwiftUI

struct CellOfTopNews: View {
    let article: Article
    var body: some View {
        VStack {
            if let urlImage = article.urlToImage, let imageUrl = URL(string: urlImage) {
                AsyncImage(url: imageUrl) {phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 260, height: 150)
                            .cornerRadius(10)
                    }
                    else {
                        ZStack {
                            Rectangle()
                                .frame(height: 150)
                                .foregroundStyle(.secondary)
                                .opacity(0.3)
                                .cornerRadius(10)
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundStyle(.secondary)
                                .scaledToFit()
                                .frame(height: 90)
                        }
                    }
                }
            }
            VStack (alignment: .leading) {
                Text(article.title ?? "No text")
                    .titleFont()
                Spacer()
                Text(article.publishedAt.formatDate())
                    .descriptionFont()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 260, height: 260)
        .padding(10)
        .background(.background)
        .cornerRadius(10)
    }
}

