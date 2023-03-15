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
    
    init() {
        rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
    }
    
    private func setup(vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
}

extension MainCoordinator: CoordinatorProtocol {
    func start() {
        let page1Coordinator = Page1Coordinator()
        page1Coordinator.start()
        childCoordinator.append(page1Coordinator)
        let page1View = page1Coordinator.rootViewController
        setup(vc: page1View, title: "Home", imageName: "paperplane", selectedImageName: "paperplane.fill")
        
        let profileCoordinator = ProfileCoordinator()
        profileCoordinator.start()
        childCoordinator.append(profileCoordinator)
        let profileView = profileCoordinator.rootViewController
        setup(vc: profileView, title: "Home", imageName: "paperplane", selectedImageName: "paperplane.fill")
        
        rootViewController.viewControllers = [page1View, page1View, page1View, page1View, profileView]
    }
}
