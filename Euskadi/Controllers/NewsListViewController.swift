//
//  NewsListViewController.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta on 19/11/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {

    // MARK: - UI
    @IBOutlet weak var tempLabel: UILabel!
    
    
    // MARK: - Properties
    weak var coordinator: MainCoordinator?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tempLabel.text = "News"
    }
}
