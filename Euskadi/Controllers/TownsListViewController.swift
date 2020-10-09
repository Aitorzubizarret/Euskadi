//
//  ViewController.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta on 27/08/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import UIKit

class TownsListViewController: UIViewController {

    // MARK: - Properties
    var townsTableView: TableView?
    var townsLocalData: Provinces? {
        didSet {
            self.addTownsTableView(data: self.townsLocalData!)
        }
    }
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation bar title.
        self.title = "Euskadi"
        
        self.getTownsLocalData()
        
    }
    
    ///
    /// Reads the local 'towns' JSON file and saves the data in 'townsLocalData'.
    ///
    private func getTownsLocalData() {
        jsonReader(filename: "towns") { (success, data) in
            DispatchQueue.main.async {
                if success, let receivedData = data {
                    self.townsLocalData = receivedData
                }
            }
        }
    }
    
    ///
    /// Adds the TableViews view to our view.
    ///
    private func addTownsTableView(data: Provinces) {
        
        // Creates the Object.
        self.townsTableView = TableView()
        
        // Sends the data to the object.
        self.townsTableView?.townsData = data
        
        // Checks if we have created the object.
        guard let table = self.townsTableView else { return }
        
        // Adds the view received from the object TableView.
        self.view.addSubview(table.getTableView(size: self.view.bounds))
    }

}
