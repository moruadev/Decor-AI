//
//  MainTabBarCoordinator.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import Foundation

final class MainTabBarCoordinator: BaseCoordinator, MainTabBarCoordinatorOutput {

    // MARK: - MainTabBarCoordinatorOutput

    var onLogout: EmptyClosure?

    // MARK: - Private Properties

    private let router: Router

    // MARK: - Initialization

    init(router: Router) {
        self.router = router
    }

    // MARK: - Coordinator

    override func start() {
        showTabBar()
    }

}

// MARK: - Private Methods

private extension MainTabBarCoordinator {

    func showTabBar() {
        let (view, output) = MainTabBarModuleConfigurator().configure()
        
        output.onHomeFlowSelect = runHomeFlow
        output.onCameraFlowSelect = runCameraFlow
        output.onHistoryFlowSelect = runHistoryFlow

        router.setRootModule(view)
        runHomeFlow(isInitial: true)
    }
    
    func runHomeFlow(isInitial: Bool) {
        guard isInitial else { return }
        
        let coordinator = HomeCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start()
    }
    
    func runCameraFlow(isInitial: Bool) {
        guard isInitial else { return }
        
        
    }
    
    func runHistoryFlow(isInitial: Bool) {
        guard isInitial else { return }
        
        
    }
}
