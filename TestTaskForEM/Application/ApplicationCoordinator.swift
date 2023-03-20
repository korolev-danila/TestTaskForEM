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
    
    private let window: UIWindow
    private let coreData: CoreDataProtocol
    private var childCoordinator = [CoordinatorProtocol]()
    
    init(window: UIWindow) {
        self.window = window
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        coreData = CoreDataManager(context: appDelegate.persistentContainer.viewContext)
    }
    
    private func showMain() {
        let mainCoordinator = MainCoordinator()
        mainCoordinator.start()
        childCoordinator = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController
        mainCoordinator.showSignIn = { [weak self] in
            self?.start()
        }
    }
}

extension ApplicationCoordinator: CoordinatorProtocol {
    func start() {
        showMain()
//        let signInCoordinator = SignInCoordinator(coreData)
//        signInCoordinator.start()
//        signInCoordinator.showMain = { [weak self] in
//            self?.showMain()
//        }
//        childCoordinator = [signInCoordinator]
//
//        window.rootViewController = signInCoordinator.rootViewController
    }
}
