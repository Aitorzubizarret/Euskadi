//
//  MainCoordinator.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta on 14/10/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    // MARK: - Properties
    var childCoordinators: [Coordinator] = [Coordinator]()
    var tabBarController: UITabBarController
    var navigationController: UINavigationController
    
    // MARK: - Methods
    init(tabBarController: UITabBarController, navigationController: UINavigationController) {
        self.tabBarController = tabBarController
        self.navigationController = navigationController
    }
    
    ///
    /// Creates and presents the main view controller.
    ///
    func start() {
        // Creates the TabBar items and ViewControllers.
        let townList = UITabBarItem()
        townList.title = "Towns"
        
        let townListVC = TownsListViewController()
        townListVC.tabBarItem = townList
        
        let newsList = UITabBarItem()
        newsList.title = "News"
        
        let newsListVC = NewsListViewController()
        newsListVC.tabBarItem = newsList
        
        // Adds the ViewControllers to the TabBar.
        tabBarController.viewControllers = [townListVC, newsListVC]
        
        self.presentTabBarController()
    }
    
    ///
    /// Selects the ViewController to display in the TabBar.
    ///
    func presentTabBarController() {
        self.tabBarController.selectedIndex = 0
        self.tabBarController.selectedViewController = self.tabBarController.viewControllers?.first!
    }
    
    ///
    /// Creates and presents TownsListViewController.
    ///
    func presentTownsListVC() {
        let townsList: TownsListViewController = TownsListViewController()
        townsList.coordinator = self
        navigationController.pushViewController(townsList, animated: true)
    }
    
    ///
    /// Creates and presents TownDetailViewController.
    ///
    func presentTownDetailVC(town: Town) {
        let townDetail: TownDetailViewController = TownDetailViewController()
        townDetail.coordinator = self
        townDetail.town = town
        navigationController.pushViewController(townDetail, animated: true)
    }
}
