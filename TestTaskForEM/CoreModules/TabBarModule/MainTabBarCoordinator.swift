//
//  MainTabBarCoordinator.swift
//  TestTaskForEM
//
//  Created by Danila on 15.03.2023.
//

import UIKit
import SwiftUI

enum ViewSettings {
    case page1
    case mock1
    case mock2
    case mock3
    case profile
}

final class MainCoordinator {
    private (set) var rootViewController: UITabBarController
    private var childCoordinator = [CoordinatorProtocol]()
    private unowned var coredata: CoreDataProtocol

    var showSignIn: (() -> Void)? 
    
    init(_ coreData: CoreDataProtocol) {
        self.coredata = coreData
        rootViewController = TabBarVC()
    }
    
    private func setupTabBarItem(vc: UIViewController, settings: ViewSettings) {
        let imageName: String
        let posX: CGFloat
        let posY: CGFloat
        
        switch settings {
        case .page1:
            imageName = "home"
            posX = 11
            posY = 11
        case .mock1:
            imageName = "like"
            posX = 10
            posY = 12
        case .mock2:
            imageName = "basket"
            posX = 11
            posY = 11
        case .mock3:
            imageName = "chat"
            posX = 11
            posY = 11
        case .profile:
            imageName = "profile"
            posX = 11
            posY = 11
        }
        
        guard let defaultImage = UIImage(named: imageName) else { return }
        
        let circle = UIImage.circle(diameter: 40, color: UIColor(red: 238/255, green: 239/255, blue: 244/255, alpha: 0.1))
        let selectedImage = circle.overlayWith(image: defaultImage, posX: posX, posY: posY)
        vc.tabBarItem = UITabBarItem(title: nil, image: defaultImage, selectedImage: selectedImage)
    }
}

// MARK: - CoordinatorProtocol
extension MainCoordinator: CoordinatorProtocol {
    func setViewToRoot() {
        
        let page1Coordinator = Page1Coordinator(coredata: coredata)
        page1Coordinator.setViewToRoot()
        childCoordinator.append(page1Coordinator)
        setupTabBarItem(vc: page1Coordinator.rootViewController, settings: ViewSettings.page1)
        
        let mock1Coordinator = MockCoordinator()
        setupTabBarItem(vc: mock1Coordinator.rootViewController, settings: ViewSettings.mock1)
        
        let mock2Coordinator = MockCoordinator()
        setupTabBarItem(vc: mock2Coordinator.rootViewController, settings: ViewSettings.mock2)
        
        let mock3Coordinator = MockCoordinator()
        setupTabBarItem(vc: mock3Coordinator.rootViewController, settings: ViewSettings.mock3)
        
        let profileCoordinator = ProfileCoordinator(coredata)
        profileCoordinator.setViewToRoot()
        childCoordinator.append(profileCoordinator)
        setupTabBarItem(vc: profileCoordinator.rootViewController, settings: ViewSettings.profile)
        profileCoordinator.showSignIn = { [weak self] in
            self?.showSignIn?()
        }
        
        rootViewController.viewControllers = [page1Coordinator.rootViewController,
                                              mock1Coordinator.rootViewController,
                                              mock2Coordinator.rootViewController,
                                              mock3Coordinator.rootViewController,
                                              profileCoordinator.rootViewController]
    }
}
