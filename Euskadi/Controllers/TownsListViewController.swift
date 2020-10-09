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
    var townsViewModel: TownsViewModel = TownsViewModel()
    var townsTableView: TableView?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation bar title.
        self.title = "Euskadi"
        
        self.bind()
    }
    
    ///
    /// Gets new data from the ViewModel.
    ///
    private func bind() {
        self.townsViewModel.binding = {
            if let provincesData = self.townsViewModel.townsList {
                self.addTownsTableView(data: provincesData)
            }
        }
    }
    
    ///
    /// Adds the TableViews view with data to our view.
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
