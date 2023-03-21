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
        rootViewController.view.backgroundColor = UIColor(cgColor: CGColor(red: 250/255, green: 249/255,
                                                                           blue: 255/255, alpha: 1))
        network = NetworkManager()
        self.coredata = coredata
    }
}

extension Page1Coordinator: CoordinatorProtocol {
    func start() {
        let vm = Page1ViewModel(network: network, coredata: coredata)
        let view = Page1View(viewModel: vm)
       
        rootViewController.setViewControllers([UIHostingController(rootView: view)], animated: false)
    }
}
