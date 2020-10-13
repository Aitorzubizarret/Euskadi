//
//  TableView.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta on 27/09/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import UIKit

protocol TableViewActionsDelegate {
    func rowTapped(indexPath: IndexPath)
}

class TableView: NSObject {
    
    // MARK: - Properties
    let cellName: String = "cell"
    private var tableView: UITableView?
    public var townsData: Provinces?
    public var actionsDelegate: TableViewActionsDelegate?
    
    // MARK: - Methods
    ///
    /// Creates the UITableView with the received size, and registers a UITableViewCell for the table.
    ///
    /// - Parameter size: The size the UITableView is going to have.
    ///
    private func initialize(size: CGRect) {
        
        // Creates the TableView
        self.tableView = UITableView(frame: size, style: UITableView.Style.plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        // Registers the cell.
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: self.cellName)
    }
    
    ///
    /// Calls 'initialize' method with the received size to create the UITableView and sends back the TableView as a UIView.
    ///
    /// - Parameter size: The size of the view.
    /// - Returns: The tableView as a UIView.
    ///
    public func getTableView(size: CGRect) -> UIView {
        
        // Creates and initializes the TableView.
        self.initialize(size: size)
        
        // Returns the TableView as a UIView.
        if let tableView = self.tableView {
            return tableView
        } else {
            let errorView = UIView(frame: size)
            errorView.backgroundColor = UIColor.red
            return errorView
        }
    }
}

// MARK: - Extension : UITableViewDataSource
extension TableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if let data = self.townsData {
            return data.provinces.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = self.townsData {
            return data.provinces[section].towns.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let data = self.townsData {
            return data.provinces[section].name
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellText: String = ""
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellName, for: indexPath)
        if let data = self.townsData {
            cellText = data.provinces[indexPath.section].towns[indexPath.row].name
        }
        cell.textLabel?.text = cellText
        return cell
    }
}

// MARK: - Extension : UITableViewDelegate
extension TableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = self.actionsDelegate {
            delegate.rowTapped(indexPath: indexPath)
        }
    }
}
