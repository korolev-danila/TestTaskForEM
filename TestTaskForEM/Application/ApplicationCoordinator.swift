//
//  ApplicationCoordinator.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import UIKit

protocol CoordinatorProtocol {
    func setViewToRoot()
}

final class ApplicationCoordinator {
    
    private let window: UIWindow
    private let coreData: CoreDataProtocol
    private var childCoordinator = [CoordinatorProtocol]()
    
    init(window: UIWindow) {
        self.window = window
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        coreData = CoreDataManager(context: appDelegate.persistentContainer.viewContext)
    }
    
    private func showMain() {
        let mainCoordinator = MainCoordinator(coreData)
        mainCoordinator.setViewToRoot()
        childCoordinator = [mainCoordinator]
        mainCoordinator.showSignIn = { [weak self] in
            self?.setViewToRoot()
        }
        
        window.rootViewController = mainCoordinator.rootViewController
    }
}

// MARK: - CoordinatorProtocol
extension ApplicationCoordinator: CoordinatorProtocol {
    func setViewToRoot() {
        
        let signInCoordinator = SignInCoordinator(coreData)
        signInCoordinator.setViewToRoot()
        signInCoordinator.showMain = { [weak self] in
            self?.showMain()
        }
        childCoordinator = [signInCoordinator]

        window.rootViewController = signInCoordinator.rootViewController
    }
}
