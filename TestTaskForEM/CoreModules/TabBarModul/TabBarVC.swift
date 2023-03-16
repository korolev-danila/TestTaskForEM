//
//  TabBarVC.swift
//  TestTaskForEM
//
//  Created by Danila on 16.03.2023.
//

import UIKit

final class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        settingTabBar()
    }
    
    private func settingTabBar() {
        tabBar.tintColor = .gray
        tabBar.backgroundColor = .white
        tabBar.layer.cornerRadius = 30
        tabBar.layer.masksToBounds = true
        tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
