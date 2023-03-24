//
//  SignInCoordinator.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import UIKit
import SwiftUI

final class SignInCoordinator {
    private (set) var rootViewController: UINavigationController
    
    var showMain: (() -> Void)?
    var showSignIn: (() -> Void)?
    
    private var viewModel: SignInViewModel
    
    init(_ coreData: CoreDataProtocol) {
        self.rootViewController = UINavigationController()
        viewModel = SignInViewModel(coreData)
    }
    
    private func showLoginView() {
        var view = LoginView(viewModel)
        view.showMain = { [weak self] in
            self?.showMain?()
        }
        rootViewController.setViewControllers([UIHostingController(rootView: view)], animated: true)
    }
}

// MARK: - CoordinatorProtocol
extension SignInCoordinator: CoordinatorProtocol {
    func setViewToRoot() {
        var view = SignInView(viewModel)
        view.showMain = { [weak self] in
            self?.showMain?()
        }
        
        view.showLogin = { [weak self] in
            self?.showLoginView()
        }
        rootViewController.setViewControllers([UIHostingController(rootView: view)], animated: false)
    }
}
