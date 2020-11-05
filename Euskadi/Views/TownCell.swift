//
//  TownCell.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta on 02/11/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import UIKit

class TownCell: UITableViewCell {

    // MARK: - UI
    
    @IBOutlet weak var townImage: UIImageView!
    @IBOutlet weak var townNameLabel: UILabel!
    
    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.townImage.contentMode = .scaleAspectFill
        self.townNameLabel.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    ///
    /// Gets values and loads them in the UI elements.
    ///
    public func displayValues(townName: String, townImage: String) {
        // Town photo.
        if townImage != "" {
            self.townImage.image = UIImage(named: townImage)
        } else {
            self.townImage.image = UIImage(named: "no-picture")
        }
        
        
        // Town name.
        self.townNameLabel.text = townName
    }
    
}
