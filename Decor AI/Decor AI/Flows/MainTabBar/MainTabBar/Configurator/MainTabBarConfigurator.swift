//
//  MainTabBarConfigurator.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import UIKit

final class MainTabBarModuleConfigurator {

    func configure() -> (UIViewController, MainTabBarModuleOutput) {
        let view = MainTabBarViewController()
        let presenter = MainTabBarPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
