//
//  HomeCoordinator.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import Foundation

final class HomeCoordinator: BaseCoordinator {

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    // MARK: - Coordinator

    override func start() {
        showHome()
    }

}

// MARK: - Private Methods

private extension HomeCoordinator {

    func showHome() {
        let (view, _) = HomeModuleConfigurator().configure()
        router.setNavigationControllerRootModule(view, animated: false, hideBar: false)
    }

}
