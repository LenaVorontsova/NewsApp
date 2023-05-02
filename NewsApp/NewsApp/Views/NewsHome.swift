//
//  NewsHome.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 02.05.2023.
//

import SwiftUI

struct NewsHome: View {
    @ObservedObject private var newsListVM = NewsListVM()
    
    init() {
        newsListVM.loadData()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            NewsListView(newsCollection: self.newsListVM.news,
                         imageData: self.newsListVM.imageData)
        }
    }
}

struct NewsHome_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewsHome()
        }
    }
}
