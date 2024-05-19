//
//  TodoView.swift
//  Everyday
//
//  Created by Dallas Gere on 5/16/24.
//

import SwiftUI

struct TodoView: View {
    // color scheme
    @Environment(\.colorScheme) var colorScheme
    
    // the todo view model and the title that we are putting in
    @ObservedObject var todoViewModel = TodoViewModel()
    @State var todoTitle = ""
    
    var body: some View {
        VStack {
            Spacer(minLength: 300)
            HStack {
                Spacer(minLength: 135)
                TextField("", text: $todoTitle, prompt: Text("enter new todo"))
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            }
            Button("Add Todo"){
                todoViewModel.addTodo(todoTitle: todoTitle)
                todoTitle = ""
            }
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            .frame(width: 300, height: 35)
            .background(Color.blue)
            .cornerRadius(10)
            
            List(todoViewModel.todos, id: \.self.todoText) { todo in
                Text(todo.todoText)
            }
        }
    }
}

#Preview {
    // need this for observed objects
    struct Preview: View {
        @ObservedObject var todoViewModel = TodoViewModel()
        var body: some View {
            TodoView(todoViewModel: todoViewModel)
        }
    }
    
    return Preview()
}
