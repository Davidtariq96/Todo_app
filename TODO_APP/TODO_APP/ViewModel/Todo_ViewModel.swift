//
//  Todo_ViewModel.swift
//  TODO_APP
//
//  Created by Decagon on 10/12/2021.
//

import Foundation
class TodoViewModel {
    let defaultStorage = UserDefaults.standard
    let key = "todoList"
    var storage: [TodoItem] {
        guard let todoData = defaultStorage.object(forKey: key) as? Data else {
            return []
        }
        let decodedTodo = try? JSONDecoder().decode([TodoItem].self, from: todoData)
        return decodedTodo ?? []
    }
    func saveTodoItem(with todo: TodoItem) {
        var allTodoItems = storage
        let id = allTodoItems.map {$0.id}.max() ?? 0
        let saveTodo = TodoItem(id: id + 1, text: todo.text, isDone: todo.isDone)
        allTodoItems.append(saveTodo)
        insertTodoItems(with: allTodoItems)
    }
    func insertTodoItems(with data: [TodoItem]) {
        let encodedTodo = try? JSONEncoder().encode(data)
        UserDefaults.standard.set(encodedTodo, forKey: key)
    }
    func deleteTodoItem(with todoId: Int) {
        let allTodoItems = storage
        if allTodoItems.contains(where: { $0.id == todoId }) {
            insertTodoItems(with: allTodoItems.filter { $0.id != todoId })
        } else {
        }
    }
    func updateTodoIsDone(with todoItem: TodoItem) {
        var allTodoItems = storage
        if let todoIndex = allTodoItems.firstIndex(where: { $0.id == todoItem.id }) {
            allTodoItems[todoIndex].isDone = todoItem.isDone
            insertTodoItems(with: allTodoItems)
        }
    }
    func updateTodoText(with todoItem: TodoItem) {
        var allTodoItems = storage
        if let todoIndex = allTodoItems.firstIndex(where: { $0.id == todoItem.id }) {
            allTodoItems[todoIndex].text = todoItem.text
            insertTodoItems(with: allTodoItems)
        }
    }
    func getOneItem (with index: Int ) -> TodoItem? {
        storage.first(where: {todoitem in
            todoitem.id == index
        })
    }

}
