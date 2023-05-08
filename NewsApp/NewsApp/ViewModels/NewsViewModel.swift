//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 02.05.2023.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var news: [News] = []
    let apiKey = "e5642ec49a244ad98f0a81772729d70c"
    
    func fetchNews() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)") else {
            print("Invalid URL")
            return
        }

        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching news: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Unknown error fetching news")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                if !decodedResponse.articles.isEmpty {
                    DispatchQueue.main.async {
                        self.news = decodedResponse.articles
                    }
                } else {
                    print("Empty")
                }
            } catch let error {
                print("Error decoding news: \(error)")
            }

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
