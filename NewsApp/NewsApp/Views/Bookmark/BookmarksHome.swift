//
//  BookmarksHome.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 03.05.2023.
//

import SwiftUI

struct BookmarksHome: View {
    @ObservedObject private var newsListVM = NewsListVM()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            NewsListView(newsCollection: self.newsListVM.bookmarks,
                         imageData: self.newsListVM.imageData, newsList: newsListVM)
        }
    }
}

struct BookmarksHome_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookmarksHome()
        }
    }
}
