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
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var townNameLabel: UILabel!
    
    // MARK: - Properties
    
    weak var coordinator: MainCoordinator?
    public var town: Town?
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setContenViewHeight()
        
        // Checks if the VC received a Town.
        if let thisTown = self.town {
            self.setTownImage(imageName: thisTown.image)
            self.setTownName(name: thisTown.name)
        }
    }
    
    ///
    /// Sets the height of the contentView and thus the height of the ScrollView.
    ///
    private func setContenViewHeight() {
        self.contentViewHeightConstraint.constant = 1300
        self.view.layoutIfNeeded()
    }
    
    ///
    /// Sets the town image or a default one in case there is no picture of the town.
    ///
    private func setTownImage(imageName: String) {
        self.detailImage.contentMode = .scaleAspectFill
        
        if imageName != "" {
            self.detailImage.image = UIImage(named: imageName)
        } else {
            self.detailImage.image = UIImage(named: "no-picture")
        }
    }
    
    ///
    /// Sets a value (Town name) to the label 'townNameLabel'.
    ///
    private func setTownName(name: String) {
        self.townNameLabel.text = name
    }
}
