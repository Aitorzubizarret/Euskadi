//
//  Coordinator.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta on 14/10/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
