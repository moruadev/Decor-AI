//
//  HomePresenter.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

final class HomePresenter: HomeModuleOutput {

    // MARK: - Properties

    weak var view: HomeViewInput?

    // MARK: - Private Properties

}

// MARK: - HomeModuleInput

extension HomePresenter: HomeModuleInput {}

// MARK: - Home

extension HomePresenter: HomeViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

    func update() {
        
    }

}

// MARK: - Private Methods

private extension HomePresenter {

}
