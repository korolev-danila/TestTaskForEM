//
//  ProfileCoordinator.swift
//  TestTaskForEM
//
//  Created by Danila on 15.03.2023.
//

import UIKit
import SwiftUI

final class ProfileCoordinator {
    var rootViewController: UINavigationController
    private var coreData: CoreDataProtocol
    
    var showSignIn: () -> () = { }
    
    init(_ coreData: CoreDataProtocol) {
        rootViewController = UINavigationController()
        rootViewController.view.backgroundColor = UIColor(cgColor: CGColor(red: 250/255, green: 249/255,
                                                                           blue: 255/255, alpha: 1))
        rootViewController.navigationBar.isHidden = true
        self.coreData = coreData
    }
}

extension ProfileCoordinator: CoordinatorProtocol {
    func start() {
        let vm = ProfileViewModel(coreData)
        var view = ProfileView(vm)
        
        view.showSignIn = { [weak self] in
            self?.showSignIn()
        }
        rootViewController.setViewControllers([UIHostingController(rootView: view)], animated: false)
    }
}
