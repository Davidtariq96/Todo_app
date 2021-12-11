//
//  Todo_Item.swift
//  TODO_APP
//
//  Created by Decagon on 10/12/2021.
//

import Foundation

struct TodoItem: Codable {
    let id: Int
    var text: String
    var isDone: Bool
}
