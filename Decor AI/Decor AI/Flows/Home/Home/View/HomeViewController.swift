//
//  HomeViewController.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let buttonSize = CGSize(width: 250.0, height: 30.0)
    }

    // MARK: - Properties

    var output: HomeViewOutput?

    // MARK: - Private Properties

    private let randomImageView = UIImageView()
    private let buttonContainer = UIView()
    private let updateButton = UIButton(type: .custom)

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    override func viewDidLayoutSubviews() {
        
    }

}

// MARK: - HomeViewInput

extension HomeViewController: HomeViewInput {

    func setupInitialState() {
        configureBackground()
        configureNavigationBar()
        configureImageView()
        configureButtonContainer()
        configureUpdateButton()
    }
}

// MARK: - Configuration

private extension HomeViewController {

    func configureBackground() {
        view.backgroundColor = Color.Main.background
    }

    func configureNavigationBar() {
        navigationController?.applyWhiteNavigationBarStyle()
        title = R.string.localizable.home()
    }

    func configureImageView() {
        view.addSubview(randomImageView)
        randomImageView.contentMode = .scaleAspectFit
        randomImageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
    }

    func configureButtonContainer() {
        view.addSubview(buttonContainer)
        buttonContainer.anchor(top: randomImageView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        buttonContainer.heightAnchor.constraint(equalTo: randomImageView.heightAnchor, multiplier: 1.0 / 3.0, constant: 0).isActive = true
    }

    func configureUpdateButton() {
        buttonContainer.addSubview(updateButton)
        updateButton.setTitle(R.string.localizable.home(), for: .normal)
        updateButton.addTarget(self, action: #selector(updateButtonPressed), for: .touchUpInside)

        updateButton.anchorCenter(to: buttonContainer)
        updateButton.anchorSize(size: Constants.buttonSize)
    }

}

// MARK: - Actions

private extension HomeViewController {

    @objc
    func updateButtonPressed() {
        output?.update()
    }

}
