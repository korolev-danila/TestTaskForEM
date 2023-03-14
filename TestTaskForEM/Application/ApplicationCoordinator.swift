//
//  ApplicationCoordinator.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import UIKit

protocol CoordinatorProtocol {
    func start()
}

final class ApplicationCoordinator {
    
    let window: UIWindow
    private var childCoordinator = [CoordinatorProtocol]()
    
    init(window: UIWindow) {
        self.window = window
    }
}

extension ApplicationCoordinator: CoordinatorProtocol {
    func start() {
        let signInCoordinator = SignInCoordinator()
        signInCoordinator.start()
        childCoordinator = [signInCoordinator]
        window.rootViewController = signInCoordinator.rootViewController
    }
}
