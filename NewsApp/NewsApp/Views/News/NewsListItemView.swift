//
//  NewsListItemView.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 08.05.2023.
//

import SwiftUI

struct NewsListItemView: View {
    @EnvironmentObject var bookmarkViewModel: BookmarkViewModel
    let news: News
//    var dataImage: Data? {
//        var d = Data()
//        d = news.getImage(urlString: news.urlToImage!) { data in
//            if let data = data  {
//                DispatchQueue.main.async {
//                    return data
//                }
//            }
//        }
//        return d
//    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(uiImage: UIImage(systemName: "globe")!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 30, height: 200, alignment: .center)
                .clipped()
                .cornerRadius(15)

//            Image(uiImage: (news.urlToImage == nil ? UIImage(systemName: "globe")! : UIImage(data: dataImage!))!)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: UIScreen.main.bounds.width - 30, height: 200, alignment: .center)
//                .clipped()
//                .cornerRadius(15)

            Text(news.title!)
                .font(.headline)
                .foregroundColor(.black)
                .lineLimit(3)
            
            Text(news.description != nil ? news.description! : "uknown")
                .font(.caption)
                .foregroundColor(.black)
            
            Text(news.author != nil ? news.author! : "uknown")
                .font(.caption2)
                .foregroundColor(.black)
            
            HStack {
                Text(news.publishedAt != nil ? news.publishedAt! : "uknown")
                    .font(.caption2)
                    .foregroundColor(.black)
                Spacer()
                Button {
                    bookmarkViewModel.addBookmark(news: news)
                } label: {
                    Image(systemName: "bookmark")
                }
                .buttonStyle(.bordered)
            }
        }
        .padding([.horizontal, .bottom])
    }
    
//    func getImage(urlString: String, completion: @escaping (((Data)?) -> Void)) {
//        guard let url = URL(string: urlString) else {
//            completion(nil)
//            return
//        }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard error == nil, let data = data else {
//                completion(nil)
//                return
//            }
//            completion(data)
//        }.resume()
//    }
}
