//
//  MockCoordinator.swift
//  TestTaskForEM
//
//  Created by Danila on 16.03.2023.
//

import UIKit
import SwiftUI

final class MockCoordinator {
    var rootViewController: UIViewController
    
    init() {
        rootViewController = UIHostingController(rootView: MockView())
    }
}

extension MockCoordinator: CoordinatorProtocol {
    func start() {
        
    }
}
