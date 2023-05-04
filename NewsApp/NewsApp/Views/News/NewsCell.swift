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
    @State private var isPresented: Bool = false
    @ObservedObject var newsList: NewsListVM
    
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
                    toggleBookmark(news: news)
                } label: {
                    Image(systemName: newsList.isBookmarked(news: news.news) ? "bookmark.fill" : "bookmark")
                }
                .buttonStyle(.bordered)
            }
        }
        .padding([.horizontal, .bottom])
    }
    
    private func toggleBookmark(news: NewsViewModel) {
        if newsList.isBookmarked(news: news.news) {
            newsList.removeBookmark(news: news.news)
        } else {
            newsList.addBookmark(news: news.news)
        }
    }
}
