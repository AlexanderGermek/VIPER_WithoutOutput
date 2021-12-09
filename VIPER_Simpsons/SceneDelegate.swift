//
//  SceneDelegate.swift
//  VIPER_Simpsons
//
//  Created by iMac on 28.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
			   options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowScene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: windowScene)
		window.rootViewController = QuotesAssembly().createModule()
		window.makeKeyAndVisible()
		self.window = window
	}
}
