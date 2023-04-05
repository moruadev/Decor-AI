//
//  Presentable.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {

    func toPresent() -> UIViewController? {
        return self
    }

}
