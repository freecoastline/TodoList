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
    
    @State private var isFinishedTheTask = false
    @State private var showAddTaskSheet = false
    @State private var showDateChosenPage = false
    @State private var taskTitle = ""
    @State private var description = ""
    
    @StateObject var viewModel = TodoListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                LazyVGrid(columns: [GridItem()], alignment: .leading, spacing:listItemSpacing ,content: {
                    ForEach(viewModel.todoListItems, id: \.id) { item in
                        HStack {
                            Circle().fill(item.isFinished ?  Color.green : Color.white).stroke(Color.gray).frame(width: 30).padding().onTapGesture {
                                withAnimation {
                                    viewModel.finishTask(task: item)
                                }
                            }
                            Text(item.titile)
                        }
                    }
                })
                Spacer()
            }
            .navigationTitle("Today")
        }
        HStack(content: {
            Spacer()
            Button {
                showAddTaskSheet.toggle()
            } label: {
                Image(systemName: "plus.app").font(.system(size: 40))
                    .padding()
            }
            .sheet(isPresented: $showAddTaskSheet) {
                VStack(alignment: .leading, spacing: 12, content: {
                       TextField("For example:go to supermarket on saturday", text: $taskTitle)
                           .font(.title3)
                       TextField("description", text: $description)
                           .font(.title3)
                       Spacer()
                }).padding()
                HStack(alignment: .center, content: {
                    Button("今天") {
                        showDateChosenPage.toggle()
                    }
                    .sheet(isPresented: $showDateChosenPage) {
                        DateChosenSheet()
                    }
                })
                .presentationDetents([.fraction(0.6)])
                
            }
        })
    }
    
    init(filter: FilterType) {
        self.filter = filter
    }
}

#Preview {
    ProspectView(filter: .today)
}
