//
//  HomeModuleConfigurator.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import UIKit

final class HomeModuleConfigurator {

    func configure() -> (UIViewController, HomeModuleOutput) {
        let view = HomeViewController()
        let presenter = HomePresenter()

        presenter.view = view
        view.output = presenter
        return (view, presenter)
    }

}

