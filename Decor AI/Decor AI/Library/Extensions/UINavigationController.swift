//
//  UINavigationController.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import UIKit

extension UINavigationController {

    func applyWhiteNavigationBarStyle() {
        self.navigationBar.barStyle = .default
        self.navigationBar.barTintColor = ColorFactory.NavigationBarStyle.White.background
        self.navigationBar.tintColor = ColorFactory.NavigationBarStyle.White.text
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorFactory.NavigationBarStyle.White.text,
                                                  NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0, weight: .semibold)]
        self.navigationBar.isTranslucent = false
    }

}
