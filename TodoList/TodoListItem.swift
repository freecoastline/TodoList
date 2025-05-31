//
//  TodoListItem.swift
//  TodoList
//
//  Created by ken on 2025/5/31.
//

import Foundation


struct TodoListItem:Identifiable {
    var id = UUID()
    var titile:String
    var detail:String
    var ddl:Date
    var isFinished = false
}
