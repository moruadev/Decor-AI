//
//  MainTabBar.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import UIKit

enum MainTab: Int, CaseIterable {

    case home
    case camera
    case history

    // MARK: - Properties

    var title: String {
        switch self {
        case .home:
            return ""
        case .camera:
            return ""
        case .history:
            return ""
        }
    }

    var image: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house.fill")!
        case .camera:
            return UIImage(systemName: "camera.aperture")!
        case .history:
            return UIImage(systemName: "clock.fill")!
        }
    }

    var selectedImage: UIImage {
        return image
    }

}
