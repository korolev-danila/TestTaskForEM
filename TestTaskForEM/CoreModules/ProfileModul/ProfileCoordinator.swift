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
    
    init() {
        rootViewController = UINavigationController()
    }
}

extension ProfileCoordinator: CoordinatorProtocol {
    func start() {
        print("ProfileCoordinator start")
    }
}
