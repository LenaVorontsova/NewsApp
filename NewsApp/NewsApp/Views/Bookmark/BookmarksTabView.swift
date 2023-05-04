//
//  BookmarksTabView.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 03.05.2023.
//

import SwiftUI

struct BookmarksTabView: View {
    @StateObject var newsListVM = NewsListVM()
    var body: some View {
        NavigationView {
            BookmarksHome().navigationTitle("Bookmarks")
        }
    }
}

struct BookmarksTabView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksTabView(newsListVM: NewsListVM())
    }
}