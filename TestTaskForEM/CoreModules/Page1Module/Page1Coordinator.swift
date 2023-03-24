//
//  Page1Coordinator.swift
//  TestTaskForEM
//
//  Created by Danila on 15.03.2023.
//

import UIKit
import SwiftUI

final class Page1Coordinator {
    private (set) var rootViewController: UINavigationController
    private let network: NetworkManagerProtocol
    private unowned var coredata: CoreDataProtocol
    
    init(coredata: CoreDataProtocol) {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.isHidden = true
        
        network = NetworkManager()
        self.coredata = coredata
    }
    
    func showPage2(_ model: Model) {
        let vm = Page2ViewModel(network: network, model: model)
        var view = Page2View(viewModel: vm)
        
        view.dismissView = { [weak self] in
            self?.rootViewController.popViewController(animated: true)
        }
        
        rootViewController.pushViewController(UIHostingController(rootView: view), animated: true)
    }
}

// MARK: - CoordinatorProtocol
extension Page1Coordinator: CoordinatorProtocol {
    func setViewToRoot() {
        let vm = Page1ViewModel(network: network, coredata: coredata)
        var view = Page1View(viewModel: vm)
        
        view.showPage2 = { [weak self] model in
            self?.showPage2(model)
        }
        
        rootViewController.setViewControllers([UIHostingController(rootView: view)], animated: false)
        rootViewController.view.backgroundColor = UIColor(ColorManager.backgroundWhite)
    }
}
