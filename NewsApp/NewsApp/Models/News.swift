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
}

struct NewsEnvelope: Decodable {
    let status: String
    let totalResults: Int
    let articles: [News]
}
