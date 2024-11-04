//
//  CellOfOtherNews.swift
//  NewsApp
//
//  Created by Vladimir Fursov on 04.11.2024.
//

import Foundation
import SwiftUI

struct CellOfOtherNews: View {
    let article: Article
    var body: some View {
        VStack {
            if let url = article.urlToImage, let imageUrl = URL(string: url) {
                AsyncImage(url: imageUrl) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .cornerRadius(10)
                    }
                    else {
                        ZStack {
                            Rectangle()
                                .frame(width: 120, height: 120)
                                .foregroundStyle(.secondary)
                                .opacity(0.3)
                                .cornerRadius(10)
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundStyle(.secondary)
                                .scaledToFit()
                                .frame(width: 50)
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
        .frame(width: 120, height: 240)
        .padding(10)
        .background(.background)
        .cornerRadius(10)
    }
}
