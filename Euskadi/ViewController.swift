//
//  ViewController.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta on 27/08/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Reads the 'towns' JSON file.
        jsonReader(filename: "towns") { (success, data) in
            DispatchQueue.main.async {
                if success, let receivedData = data {
                    print(receivedData)
                }
            }
        }
    }

}

