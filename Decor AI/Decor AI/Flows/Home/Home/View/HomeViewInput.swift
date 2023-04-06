//
//  HomeViewInput.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import Foundation
import Photos

protocol HomeViewInput: AnyObject {
    func setupInitialState()
    func updateCollectionView(with assets: PHFetchResult<PHAsset>)
}
