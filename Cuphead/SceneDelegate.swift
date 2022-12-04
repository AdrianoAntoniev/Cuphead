//
//  SceneDelegate.swift
//  Cuphead
//
//  Created by Adriano Rodrigues Vieira on 03/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let window = UIWindow(windowScene: scene as? UIWindowScene) else { return }

        self.window = window

        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

extension UIWindow {
    convenience init?(windowScene: UIWindowScene?) {
        guard let windowScene = windowScene else { return nil }

        self.init(windowScene: windowScene)
    }
}
