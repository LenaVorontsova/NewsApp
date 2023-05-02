//
//  ArticleRowView.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 02.05.2023.
//

import SwiftUI

struct NewsCell: View {
    let news: NewsViewModel
    let image: Image
    @EnvironmentObject var newsBookmarkVM: NewsBookmarkViewModel
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 30, height: 200, alignment: .center)
                .clipped()
                .cornerRadius(15)
            
            Text(news.title)
                .font(.headline)
                .foregroundColor(.black)
                .lineLimit(3)
            
            Text(news.description)
                .font(.caption)
                .foregroundColor(.black)
            
            Text(news.author)
                .font(.caption2)
                .foregroundColor(.black)
            
            HStack {
                Text(news.publishedAt)
                    .font(.caption2)
                    .foregroundColor(.black)
                Spacer()
                Button {
                    toggleBookmark(news: news.news)
                } label: {
                    Image(systemName: newsBookmarkVM.isBookmarked(news: news.news) ? "bookmark.fill" : "bookmark")
                }
                .buttonStyle(.bordered)
            }
        }
        .padding([.horizontal, .bottom])
    }
    
    private func toggleBookmark(news: News) {
        if newsBookmarkVM.isBookmarked(news: news) {
            newsBookmarkVM.removeBookmark(news: news)
        } else {
            newsBookmarkVM.addBookmark(news: news)
        }
    }
}
