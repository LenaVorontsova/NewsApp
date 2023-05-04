//
//  NewsListView.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 02.05.2023.
//

import SwiftUI

struct NewsListView: View {
    let newsCollection: [NewsViewModel]
    let imageData: [String: Data]
    @ObservedObject var newsList: NewsListVM
    
    var body: some View {
        List(self.newsCollection, id: \.url) {
            news in NewsCell(
                news: news,
                image: Image(uiImage: self.imageData[news.urlToImage] == nil ? UIImage(systemName: "globe")! : UIImage(data: self.imageData[news.urlToImage]!)!),
                newsList: newsList)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}
