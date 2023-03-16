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
    
    init() {
        rootViewController = UINavigationController()
    }
}

extension Page1Coordinator: CoordinatorProtocol {
    func start() {
        print("Page1Coordinator start")
        rootViewController.view.backgroundColor = .gray
    }
}
