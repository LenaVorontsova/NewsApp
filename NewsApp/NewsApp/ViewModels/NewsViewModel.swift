//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 02.05.2023.
//

import Foundation

struct NewsViewModel {
    let news: News
    
    var id: String { url }
    
    var author: String {
        return news.author ?? "Unknown"
    }
    var title: String {
        return news.title ?? ""
    }
    var description: String {
        return news.description ?? ""
    }
    var urlToImage: String {
        return news.urlToImage ?? "https://sportishka.com/uploads/posts/2022-04/1650710287_10-sportishka-com-p-melburn-krasivo-foto-11.jpg"
    }
    var url: String {
        return news.url ?? ""
    }
    var publishedAt: String {
        var dateText = (news.publishedAt!.replacingOccurrences(of: "T", with: " "))
        var arr = dateText.components(separatedBy: ":")
        arr.removeLast()
        dateText = arr.joined(separator: ":")
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd hh:mm"
        if let date = dateFormater.date(from: dateText) {
            dateFormater.dateFormat = "dd.MM.yyyy hh:mm"
            let newDate = dateFormater.string(from: date)
            return newDate
        } else {
            return ""
        }
    }
}
