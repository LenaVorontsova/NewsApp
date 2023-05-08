//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 30.04.2023.
//

import SwiftUI

@main
struct NewsAppApp: App {
    let newsViewModel = NewsViewModel()
    let bookmarksViewModel = BookmarkViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(newsViewModel)
                .environmentObject(bookmarksViewModel)
        }
    }
}
