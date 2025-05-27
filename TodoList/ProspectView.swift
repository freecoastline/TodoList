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
            Text(title).navigationTitle(title)
        }
    }
    
    init(filter: FilterType) {
        self.filter = filter
    }
}

#Preview {
    ProspectView(filter: .today)
}
