//
//  MainTabBarCoordinatorOutput.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import Foundation

typealias EmptyClosure = () -> Void

protocol MainTabBarCoordinatorOutput: AnyObject {
    var onLogout: EmptyClosure? { get set }
}
