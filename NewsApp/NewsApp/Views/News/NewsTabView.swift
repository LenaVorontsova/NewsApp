//
//  NewsTabView.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 02.05.2023.
//

import SwiftUI

struct NewsTabView: View {
    @StateObject var newsListVM = NewsListVM()
    var body: some View {
        NavigationView {
            NewsHome().navigationTitle("News")
        }
    }
}

struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView(newsListVM: NewsListVM())
    }
}
