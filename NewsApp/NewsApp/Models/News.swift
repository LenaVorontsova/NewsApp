//
//  News.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 30.04.2023.
//

import Foundation

struct News: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
    let publishedAt: String?
    
    func getImage(urlString: String, completion: @escaping (((Data)?) -> Data?)) {
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

extension News: Identifiable {
    var id: String { url! }
}

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [News]
}
