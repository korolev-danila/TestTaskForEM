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
        let fillerView = UIView()
        fillerView.frame = tabBar.frame
        fillerView.frame.size.height = tabBar.frame.height + 45
        fillerView.frame.origin.y -= 45
        fillerView.layer.cornerRadius = 25
        fillerView.backgroundColor = .white
        view.addSubview(fillerView)
        
        tabBar.clipsToBounds = true
        tabBar.isTranslucent = false
        tabBar.tintColor = .gray
        tabBar.backgroundColor = .clear
        
        view.bringSubviewToFront(tabBar)
    }
}
