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
            ""
        case .camera:
            ""
        case .history:
            ""
        }
    }

    var image: UIImage {
        switch self {
        case .home:
            break
        case .camera:
            break
        case .history:
            break
        }
    }

    var selectedImage: UIImage {
        return image
    }

}
