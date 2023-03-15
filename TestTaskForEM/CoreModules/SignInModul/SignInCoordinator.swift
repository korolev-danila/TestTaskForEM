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
    var showMain: () -> () = { }
    
    private var viewModel: SignInViewModel
    
    init(_ coreData: CoreDataProtocol) {
        self.rootViewController = UINavigationController()
        viewModel = SignInViewModel(coreData)
    }
    
    private func showLoginView() {
        var view = LoginView(viewModel)
        view.showMain = { [weak self] in
            self?.showMain()
        }
        rootViewController.setViewControllers([UIHostingController(rootView: view)], animated: true)
    }
}

extension SignInCoordinator: CoordinatorProtocol {
    func start() {
        var view = SignInView(viewModel)
        view.showMain = { [weak self] in
            self?.showMain()
        }
        
        view.showLogin = { [weak self] in
            self?.showLoginView()
        }
        rootViewController.setViewControllers([UIHostingController(rootView: view)], animated: false)
    }
}
