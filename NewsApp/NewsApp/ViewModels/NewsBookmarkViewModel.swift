//
//  NewsBookmarkViewModel.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 02.05.2023.
//

import SwiftUI

@MainActor
class NewsBookmarkViewModel: ObservableObject {
    @Published private(set) var bookmarks: [News] = []
    
    func isBookmarked(news: News) -> Bool {
        bookmarks.first { news.id == $0.id } != nil
    }
    
    func addBookmark(news: News) {
        guard !isBookmarked(news: news) else {
            return
        }
        bookmarks.insert(news, at: 0 )
    }
    
    func removeBookmark(news: News) {
        guard let index = bookmarks.firstIndex(where: { $0.id == news.id} ) else {
            return
        }
        bookmarks.remove(at: index)
    }
}
