//
//  HomePresenter.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import Photos

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
        getPhotos()
    }

    func update() {
        
    }

}

// MARK: - Private Methods

private extension HomePresenter {
    func getPhotos() {
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            guard let self = self else { return }
            
            switch status {
            case .authorized, .limited:
                let fetchOptions = PHFetchOptions()
                let allPhotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                print("Found \(allPhotos.count) assets")
                DispatchQueue.main.async {
                    self.view?.updateCollectionView(with: allPhotos)
                }
            case .denied, .restricted:
                print("Not allowed")
            case .notDetermined:
                // Should not see this when requesting
                print("Not determined yet")
            @unknown default:
                break
            }
        }
    }
}
