//
//  ContentView.swift
//  TodoList
//
//  Created by ken on 2025/5/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Today", systemImage: "calendar") {
                ProspectView(filter: .today)
            }
            Tab("Preview", systemImage: "calendar.circle.fill") {
                ProspectView(filter: .preview)
            }
            Tab("search", systemImage: "magnifyingglass") {
                ProspectView(filter: .search)
            }
            Tab("Look", systemImage: "list.bullet.rectangle") {
                ProspectView(filter: .look)
            }
        }
    }
}

#Preview {
    ContentView()
}
