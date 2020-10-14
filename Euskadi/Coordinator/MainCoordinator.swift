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
    var navigationController: UINavigationController
    
    // MARK: - Methods
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    ///
    /// Creates and presents the main view controller.
    ///
    func start() {
        self.presentTownsListVC()
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
