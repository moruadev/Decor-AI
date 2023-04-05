//
//  AppDelegate.swift
//  Decor AI
//
//  Created by Damir on 04.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Public Properties

    var window: UIWindow?

    // MARK: - Private Properties

    private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
    
    // MARK: - ApplicationService

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeRootView()
        applicationCoordinator.start()
        return true
    }
}

// MARK: - Private Configuration

private extension AppDelegate {

    func initializeRootView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
    }

    func makeCoordinator() -> Coordinator {
        return ApplicationCoordinator()
    }

}

