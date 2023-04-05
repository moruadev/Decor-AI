//
//  MainTabBarPresenter.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

final class MainTabBarPresenter: MainTabBarModuleOutput {

    // MARK: - MainTabBarModuleOutput

    var onHomeFlowSelect: TabSelectClosure?
    var onCameraFlowSelect: TabSelectClosure?
    var onHistoryFlowSelect: TabSelectClosure?

    // MARK: - Properties

    weak var view: MainTabBarViewInput?

}

// MARK: - MainTabBarViewOutput

extension MainTabBarPresenter: MainTabBarViewOutput {

    func selectTab(with tab: MainTab, isInitial: Bool) {
        switch tab {
        case .home:
            onHomeFlowSelect?(isInitial)
        case .camera:
            onCameraFlowSelect?(isInitial)
        case .history:
            onHistoryFlowSelect?(isInitial)
        }
    }

}
