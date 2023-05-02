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
    
    func loadData() {
        getNews()
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
