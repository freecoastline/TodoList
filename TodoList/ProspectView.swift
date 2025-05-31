//
//  ProspectView.swift
//  TodoList
//
//  Created by ken on 2025/5/27.
//

import SwiftUI

enum FilterType {
    case today
    case preview
    case search
    case look
}

struct ProspectView: View {
    let filter:FilterType
    let listItemSpacing:CGFloat = 15
    var title:String {
        switch filter {
        case .today:
            "Today"
        case .preview:
            "Preview"
        case .search:
            "Search"
        case .look:
            "Look"
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                LazyVGrid(columns: [GridItem()], alignment: .leading, spacing:listItemSpacing ,content: {
                    HStack {
                        Circle().fill(Color.white).stroke(Color.gray).frame(width: 30).padding()
                        Text("ddd")
                    }
                    Divider()
                    HStack {
                        Circle().fill(Color.white).stroke(Color.gray).frame(width: 30).padding()
                        Text("ddd")
                    }
                    Divider()
                    HStack {
                        Circle().fill(Color.white).stroke(Color.gray).frame(width: 30).padding()
                        Text("ddd")
                    }
                })
                
                Spacer()
            }
            .navigationTitle("Today")
        }
    }
    
    init(filter: FilterType) {
        self.filter = filter
    }
}

#Preview {
    ProspectView(filter: .today)
}
