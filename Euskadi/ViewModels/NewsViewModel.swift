//
//  NewsViewModel.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta Perez on 04/01/2021.
//  Copyright © 2021 Aitor Zubizarreta. All rights reserved.
//

import UIKit

class NewsViewModel {
    
    // MARK: - Properties
    
    // Binding.
    var binding = { () -> () in }
    
    // Data Source.
    var newsList: [News] = [] {
        didSet {
            self.binding()
        }
    }
    
    // MARK: - Methods
    
    init() {
        self.demoData()
    }
    
    ///
    /// Creates demo data.
    ///
    private func demoData() {
        let n1: News = News(id: 0, title: "Title 1", body: "News body 1")
        self.newsList.append(n1)
        
        let n2: News = News(id: 1, title: "Title 2", body: "News body 2")
        self.newsList.append(n2)
        
        let n3: News = News(id: 2, title: "Title 3", body: "News body 3")
        self.newsList.append(n3)
        
        let n4: News = News(id: 3, title: "Title 4", body: "News body 4")
        self.newsList.append(n4)
    }
}
