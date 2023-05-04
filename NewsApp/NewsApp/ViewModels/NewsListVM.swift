//
//  NewsListVM.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 02.05.2023.
//

import Foundation

class NewsListVM: ObservableObject {
    @Published var news = [NewsViewModel]()
    @Published var imageData = [String: Data]()
    @Published var bookmarks = [NewsViewModel]()
    
    func loadData() {
        getNews()
    }
    
    func isBookmarked(news: News) -> Bool {
        return bookmarks.first { news.title == $0.title } != nil
    }
    
    func addBookmark(news: News) {
        guard !isBookmarked(news: news) else {
            return
        }
        bookmarks.insert(NewsViewModel(news: news), at: 0 )
    }
    
    func removeBookmark(news: News) {
        guard let index = bookmarks.firstIndex(where: { $0.id == news.id} ) else {
            return
        }
        bookmarks.remove(at: index)
    }
    
    private func getNews() {
        let network = NetworkService()
        network.getNews { (newsArticles) in
            guard let news = newsArticles else {
                return
            }
            let newsVM = news.map(NewsViewModel.init)
            self.getImages(news: newsVM)
            DispatchQueue.main.async {
                self.news = newsVM
            }
        }
    }
    
    private func getImages(news: [NewsViewModel]) {
        let network = NetworkService()
        news.forEach { i in
            guard !i.urlToImage.isEmpty else {
                return
            }
            network.getImage(urlString: i.urlToImage) { data in
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    self.imageData[i.urlToImage] = data
                }
            }
        }
    }
}
