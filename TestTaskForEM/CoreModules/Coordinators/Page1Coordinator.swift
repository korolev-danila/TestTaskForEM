//
//  Page1Coordinator.swift
//  TestTaskForEM
//
//  Created by Danila on 15.03.2023.
//

import UIKit
import SwiftUI

final class Page1Coordinator {
    var rootViewController: UINavigationController
    private let network: NetworkManagerProtocol
    private let coredata: CoreDataProtocol
    
    init(coredata: CoreDataProtocol) {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.isHidden = true
        
        network = NetworkManager()
        self.coredata = coredata
    }
    
    func showPage2() {
        let vm = Page2ViewModel(network: network)
        var view = Page2View(viewModel: vm)
        
        view.dismissView = { [weak self] in
            self?.rootViewController.popViewController(animated: true)
        }
        
        rootViewController.pushViewController(UIHostingController(rootView: view), animated: true)
    }
}

extension Page1Coordinator: CoordinatorProtocol {
    func start() {
        let vm = Page1ViewModel(network: network, coredata: coredata)
        var view = Page1View(viewModel: vm)
        
        view.showPage2 = { [weak self] in
            self?.showPage2()
        }
        
        rootViewController.setViewControllers([UIHostingController(rootView: view)], animated: false)
        rootViewController.view.backgroundColor = UIColor(cgColor: CGColor(red: 250/255, green: 249/255,
                                                                           blue: 255/255, alpha: 1))
        showPage2()
    }
}
