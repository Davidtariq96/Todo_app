//
//  Todo_Item.swift
//  TODO_APP
//
//  Created by Decagon on 10/12/2021.
//

import Foundation


struct TodoItem: Codable {
    let id: Int
    let text: String
    let isDone: Bool
}
