//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by ken on 2025/5/31.
//

import Foundation

class TodoListViewModel:ObservableObject {
    @Published
    var todoListItems = [TodoListItem(titile: "1", detail: "programming", ddl: Date()) , TodoListItem(titile: "2", detail: "programming", ddl: Date()), TodoListItem(titile: "3", detail: "programming", ddl: Date())]
    
    func finishTask(task: TodoListItem) {
        for index in todoListItems.indices {
            if todoListItems[index].id == task.id {
                todoListItems[index].isFinished = true
            }
        }
        todoListItems.removeAll {  $0.id == task.id }
    }
    
}
