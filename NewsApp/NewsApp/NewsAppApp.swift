//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Lena Vorontsova on 30.04.2023.
//

import SwiftUI

@main
struct NewsAppApp: App {
    @StateObject var newsBookmarkVM = NewsBookmarkViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(newsBookmarkVM)
        }
    }
}
