//
//  MockCoordinator.swift
//  TestTaskForEM
//
//  Created by Danila on 16.03.2023.
//

import UIKit
import SwiftUI

final class MockCoordinator {
    private (set) var rootViewController: UIViewController
    
    init() {
        rootViewController = UIHostingController(rootView: MockView())
        rootViewController.view.backgroundColor = UIColor(cgColor: CGColor(red: 250/255, green: 249/255,
                                                                           blue: 255/255, alpha: 1))
    }
}

// MARK: - CoordinatorProtocol
extension MockCoordinator: CoordinatorProtocol {
    func setViewToRoot() {
        
    }
}
