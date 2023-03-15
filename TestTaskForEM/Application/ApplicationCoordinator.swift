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
    
    private func showMain() {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        childCoordinator = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController
    }
}

extension ApplicationCoordinator: CoordinatorProtocol {
    func start() {
        var signInCoordinator = SignInCoordinator()
        signInCoordinator.start()
        signInCoordinator.showMain = { [weak self] in
            self?.showMain()
        }
        childCoordinator = [signInCoordinator]
        
        window.rootViewController = signInCoordinator.rootViewController
    }
}
