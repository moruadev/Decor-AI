//
//  MainTabBarViewController.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    // MARK: - Constants

    private enum Constants {
        static let tabBarItemTitleFont = UIFont.systemFont(ofSize: 10, weight: .regular)
        static let tabBarItemTitleOffset = UIOffset(horizontal: 0, vertical: -2)
        static let backgroundBlurAlpha: CGFloat = 0.8
    }

    // MARK: - Properties

    var output: MainTabBarViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        configureAppearance()
        configureControllers()
    }

}

// MARK: - MainTabBarViewInput

extension MainTabBarViewController: MainTabBarViewInput {
}

// MARK: - UITabBarControllerDelegate

extension MainTabBarViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let tab = MainTab(rawValue: viewController.tabBarItem.tag) else {
            return
        }
        let navigationController = viewController as? UINavigationController
        let isInitial = navigationController?.viewControllers.isEmpty ?? true
        output?.selectTab(with: tab, isInitial: isInitial)
    }

}

// MARK: - Configuration

private extension MainTabBarViewController {

    func configureAppearance() {
        tabBar.barTintColor = UIColor.clear
        tabBar.tintColor = ColorFactory.TabBar.selectedTabItem
        tabBar.unselectedItemTintColor = ColorFactory.TabBar.tabItem
        tabBar.shadowImage = UIImage(color: ColorFactory.TabBar.stroke)
        tabBar.backgroundColor = .gray
    }

    func configureControllers() {
        var controllers: [UIViewController] = []
        for tab in MainTab.allCases {
            let tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImage)
            tabBarItem.tag = tab.rawValue
            tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: Constants.tabBarItemTitleFont], for: .normal)
            tabBarItem.titlePositionAdjustment = Constants.tabBarItemTitleOffset

            let navigationController = UINavigationController()
            navigationController.tabBarItem = tabBarItem
            controllers.append(navigationController)
        }
        viewControllers = controllers
    }

}
