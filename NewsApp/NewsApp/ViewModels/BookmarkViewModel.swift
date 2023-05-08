//
//  BookmarkViewModel.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 08.05.2023.
//

import Foundation

class BookmarkViewModel: ObservableObject {
    
    @Published var bookmarks: [News] = []
    
    func addBookmark(news: News) {
        bookmarks.append(news)
    }
}
