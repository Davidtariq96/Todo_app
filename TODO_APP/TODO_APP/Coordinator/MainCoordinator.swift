//
//  MainCoordinator.swift
//  TODO_APP
//
//  Created by Decagon on 11/12/2021.
//

import UIKit

class MainCoordinator: Coordinator {
    private var window: UIWindow
    var controller: UINavigationController
    
    
    init(window: UIWindow) {
        self.window = window
        controller = UINavigationController()
    }
    
    func start() {
        let viewController = ViewController()
        viewController.view.backgroundColor = .gray
        controller.pushViewController(viewController, animated: false)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
}
