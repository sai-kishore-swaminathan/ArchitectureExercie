//
//  SceneDelegate.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 02/04/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

//        // MVVM
//        window?.rootViewController = LoginViewControllerMvvm()
//
//        // MVC
//        window?.rootViewController = LoginViewControllerMvc()
//
//
//        // MVp
//        window?.rootViewController = LoginViewControllerMvp()


        // VIPER
        window?.rootViewController = LoginRouterViper.createModule()


        window?.makeKeyAndVisible()
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

