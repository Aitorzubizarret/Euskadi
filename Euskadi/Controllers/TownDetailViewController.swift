//
//  TownDetailViewController.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta on 13/10/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import UIKit

class TownDetailViewController: UIViewController {

    // MARK: - UI
    @IBOutlet weak var townNameLabel: UILabel!
    
    // MARK: - Properties
    weak var coordinator: MainCoordinator?
    public var town: Town?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let thisTown = self.town {
            self.setTownName(name: thisTown.name)
        }
    }
    
    ///
    /// Sets a value (Town name) to the label 'townNameLabel' from a property.
    ///
    private func setTownName(name: String) {
        self.townNameLabel.text = name
    }
}
