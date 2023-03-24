//
//  ProfileCoordinator.swift
//  TestTaskForEM
//
//  Created by Danila on 15.03.2023.
//

import UIKit
import SwiftUI

final class ProfileCoordinator {
    private (set) var rootViewController: UINavigationController
    private unowned var coredata: CoreDataProtocol
    
    var showSignIn: (() -> Void)?
    
    init(_ coreData: CoreDataProtocol) {
        self.coredata = coreData
        rootViewController = UINavigationController()
        rootViewController.view.backgroundColor = UIColor(ColorManager.backgroundWhite)
        rootViewController.navigationBar.isHidden = true
    }
}

// MARK: - CoordinatorProtocol
extension ProfileCoordinator: CoordinatorProtocol {
    func setViewToRoot() {
        let vm = ProfileViewModel(coredata)
        var view = ProfileView(vm)
        
        view.showSignIn = { [weak self] in
            self?.showSignIn?()
        }
        
        rootViewController.setViewControllers([UIHostingController(rootView: view)], animated: false)
    }
}
