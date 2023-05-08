//
//  NewsListView.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 02.05.2023.
//

import SwiftUI

struct NewsListView: View {
    @EnvironmentObject var newsViewModel: NewsViewModel
    
    var body: some View {
        List(newsViewModel.news) { news in
            NewsListItemView(news: news)
        }
        .onAppear {
            newsViewModel.fetchNews()
        }
    }
}
