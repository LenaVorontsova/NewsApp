//
//  BookmarksList.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 08.05.2023.
//

import SwiftUI

struct BookmarksList: View {
    @EnvironmentObject var bookmarkViewModel: BookmarkViewModel
    
    var body: some View {
        List(bookmarkViewModel.bookmarks) { news in
            NewsListItemView(news: news)
        }
    }
}
