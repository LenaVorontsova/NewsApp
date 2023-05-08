//
//  ContentView.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 30.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewsListView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            BookmarksList()
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
