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
            
            Text(news.publishedAt)
                .font(.caption2)
                .foregroundColor(.black)
        }
        .padding([.horizontal, .bottom])
    }
}
