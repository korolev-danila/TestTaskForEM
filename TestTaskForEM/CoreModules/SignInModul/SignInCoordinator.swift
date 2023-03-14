//
//  SignInCoordinator.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import UIKit
import SwiftUI

final class SignInCoordinator {
    var rootViewController: UINavigationController
    
    init() {
        self.rootViewController = UINavigationController()
    }
}

extension SignInCoordinator: CoordinatorProtocol {
    func start() {
        let view = ViewController()
        rootViewController.setViewControllers([view], animated: false)
    }
}
