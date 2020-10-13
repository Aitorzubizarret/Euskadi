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
    public var townName: String?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = self.townName {
            self.setTownName(name: name)
        }
    }
    
    ///
    /// Sets a value (Town name) to the label 'townNameLabel' from a property.
    ///
    private func setTownName(name: String) {
        self.townNameLabel.text = name
    }
}
