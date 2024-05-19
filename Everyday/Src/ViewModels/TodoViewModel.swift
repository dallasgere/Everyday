//
//  TodoViewModel.swift
//  Everyday
//
//  Created by Dallas Gere on 5/16/24.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var todos: [TodoModel] = []
    
    func addTodo(todoTitle: String) -> Void {
        if !todoTitle.isEmpty {
            todos.append(TodoModel(todoText: todoTitle))
        }
    }
}
