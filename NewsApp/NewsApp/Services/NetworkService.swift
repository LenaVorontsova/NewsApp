//
//  NetworkService.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 02.05.2023.
//

import Foundation

final class NetworkService {
    private let baseURL = "https://newsapi.org/v2/"
    private let usTopHeadlines = "top-headlines?country=us"
    
    func getNews(completion: @escaping (([News]?) -> Void)) {
        let urlString = "\(baseURL)\(usTopHeadlines)&apiKey=\(API.key)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            let newsRes = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
            newsRes == nil ? completion(nil) : completion(newsRes!.articles )
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (((Data)?) -> Void)) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            completion(data)
        }.resume()
    }
}
