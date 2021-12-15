//
//  Coordinator.swift
//  TODO_APP
//
//  Created by Decagon on 11/12/2021.
//

import UIKit

protocol Coordinator {
    var controller: UINavigationController { get set }
    func start()
}
