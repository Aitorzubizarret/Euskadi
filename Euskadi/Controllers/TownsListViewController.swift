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
    weak var coordinator: MainCoordinator?
    var townsViewModel: TownsViewModel = TownsViewModel()
    var townsTableView: TableView?
    var detailVC: TownDetailViewController?
    
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
        
        // Sets this class as the delegate.
        self.townsTableView?.actionsDelegate = self
        
        // Sends the data to the object.
        self.townsTableView?.townsData = data
        
        // Checks if we have created the object.
        guard let table = self.townsTableView else { return }
        
        // Adds the view received from the object TableView.
        self.view.addSubview(table.getTableView(size: self.view.bounds))
    }
}

// MARK: - Extension : TableViewActionsDelegate
extension TownsListViewController: TableViewActionsDelegate {
    
    ///
    /// Gets the Town object and uses MainCoordinator to present the detail view controller after the user taps on a row in the town list.
    ///
    func rowTapped(indexPath: IndexPath) {
        let provinceSection: Int = indexPath.section
        let townRow: Int = indexPath.row
        
        // Gets data from the ViewModel and calls MainCoordinator to present the detail view controller.
        if let townList = self.townsViewModel.townsList {
            let town: Town = townList.provinces[provinceSection].towns[townRow]
            
            self.coordinator?.presentTownDetailVC(town: town)
        }
    }
}
