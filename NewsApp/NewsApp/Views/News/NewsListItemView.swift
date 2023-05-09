//
//  NewsListItemView.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 08.05.2023.
//

import SwiftUI

struct NewsListItemView: View {
    @EnvironmentObject var bookmarkViewModel: BookmarkViewModel
    let news: News
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(news.title!)
                .font(.headline)
                .foregroundColor(.black)
                .lineLimit(3)
            
            Text(news.description != nil ? news.description! : "Not found")
                .font(.caption)
                .foregroundColor(.black)
            
            Text(news.author != nil ? news.author! : "Not found")
                .font(.caption2)
                .foregroundColor(.black)
            
            HStack {
                Text(news.publishedAt != nil ? news.publishedAt! : "Not found")
                    .font(.caption2)
                    .foregroundColor(.black)
                Spacer()
                Button {
                    bookmarkViewModel.addBookmark(news: news)
                } label: {
                    Image(systemName: "bookmark")
                }
                .buttonStyle(.bordered)
            }
        }
        .padding([.horizontal, .bottom])
    }
}
