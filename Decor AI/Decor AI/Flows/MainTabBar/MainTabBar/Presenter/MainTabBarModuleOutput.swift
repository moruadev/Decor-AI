//
//  MainTabBarModuleOutput.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

typealias TabSelectClosure = (_ isInitial: Bool) -> Void

protocol MainTabBarModuleOutput: AnyObject {
    var onHomeFlowSelect: TabSelectClosure? { get set }
    var onCameraFlowSelect: TabSelectClosure? { get set }
    var onHistoryFlowSelect: TabSelectClosure? { get set }
}
