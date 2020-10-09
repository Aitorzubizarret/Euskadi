//
//  TownsViewModel.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta on 09/10/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import UIKit

class TownsViewModel {
    
    // MARK: - Properties
    // Binding.
    var binding = { () -> () in }
    
    // Data Source.
    var townsList: Provinces? {
        didSet {
            self.binding()
        }
    }
    
    // MARK: - Methods
    init() {
        self.getTownsLocalData()
    }
    
    ///
    /// Reads the local 'towns' JSON file and saves the data in 'townsList'.
    ///
    private func getTownsLocalData() {
        jsonReader(filename: "towns") { (success, data) in
            DispatchQueue.main.async {
                if success, let receivedData = data {
                    self.townsList = receivedData
                }
            }
        }
    }
}
