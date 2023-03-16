//
//  MainTabBarCoordinator.swift
//  TestTaskForEM
//
//  Created by Danila on 15.03.2023.
//

//import Foundation
import UIKit
import SwiftUI

final class MainCoordinator {
    var rootViewController: UITabBarController
    private var childCoordinator = [CoordinatorProtocol]()
//    private let coreDataManager = CoreDataManager()
//    private let networkManager = NetworkManager()
    
    var showSignIn: () -> () = { }
    
    init() {
        rootViewController = TabBarVC()
    }
    
    private func setupTabBarItem(vc: UIViewController, imageName: String) {
        guard let defaultImage = UIImage(named: imageName),
            let circle = UIImage.circle(diameter: 34, color: .lightGray).image(alpha: 0.2) else { return }
        
        let selectedImage = circle.overlayWith(image: defaultImage, posX: 8, posY: 8)
        vc.tabBarItem = UITabBarItem(title: nil, image: defaultImage, selectedImage: selectedImage)
    }
}

extension MainCoordinator: CoordinatorProtocol {
    func start() {
        
        let page1Coordinator = Page1Coordinator()
        page1Coordinator.start()
        childCoordinator.append(page1Coordinator)
        let page1View = page1Coordinator.rootViewController
        setupTabBarItem(vc: page1View, imageName: "home")
        
        let mock1Coordinator = MockCoordinator()
        mock1Coordinator.start()
        childCoordinator.append(mock1Coordinator)
        let mock1View = mock1Coordinator.rootViewController
        setupTabBarItem(vc: mock1View, imageName: "like")
        
        let mock2Coordinator = MockCoordinator()
        mock2Coordinator.start()
        childCoordinator.append(mock2Coordinator)
        let mock2View = mock2Coordinator.rootViewController
        setupTabBarItem(vc: mock2View, imageName: "basket")
        
        let mock3Coordinator = MockCoordinator()
        mock3Coordinator.start()
        childCoordinator.append(mock3Coordinator)
        let mock3View = mock3Coordinator.rootViewController
        setupTabBarItem(vc: mock3View, imageName: "chat")
        
        let profileCoordinator = ProfileCoordinator()
        profileCoordinator.start()
        childCoordinator.append(profileCoordinator)
        let profileView = profileCoordinator.rootViewController
        setupTabBarItem(vc: profileView, imageName: "profile")
        
        profileCoordinator.showSignIn = { [weak self] in
            self?.showSignIn()
        }
        
        rootViewController.viewControllers = [page1View, mock1View, mock2View, mock3View, profileView]
    }
}
