//
//  SceneDelegate.swift
//  TODO_APP
//
//  Created by Decagon on 10/12/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setupAppCoordinator(for: windowScene)
    }
    func setupAppCoordinator(for windowScene: UIWindowScene) {
        let appWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
        appWindow.windowScene = windowScene
        self.window = appWindow
        AppDelegate.standard?.window = appWindow
        coordinator = MainCoordinator(window: appWindow)
        coordinator?.start()
    }
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
