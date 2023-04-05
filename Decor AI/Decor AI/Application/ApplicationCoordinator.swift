//
//  ApplicationCoordinator.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {

    // MARK: - Coordinator

    override func start() {
        runMainFlow()
    }

}

// MARK: - Private Methods

private extension ApplicationCoordinator {

    func runMainFlow() {
        let router = MainRouter()
        let coordinator = MainTabBarCoordinator(router: router)
        coordinator.onLogout = { [weak self] in
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }

}
