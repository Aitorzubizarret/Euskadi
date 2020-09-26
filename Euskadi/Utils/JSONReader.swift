//
//  JSONReader.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta on 26/09/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import Foundation

///
/// Reads a local JSON file and sends back its data.
/// - Parameter fileName: The name of the file.
/// - Parameter success: 'True' if the JSON file has been read and / or decode correctly, otherwise 'false'.
/// - Parameter data: The data of the file as Provinces.
///
func jsonReader(filename: String, completion: @escaping(_ success: Bool, _ data: Provinces?) -> Void) {
    if let path = Bundle.main.path(forResource: filename, ofType: "json") {
        do {
            let fileUrl = URL(fileURLWithPath: path)
            
            // Get the data from the JSON file.
            let data = try Data(contentsOf: fileUrl, options: Data.ReadingOptions.alwaysMapped)
            
            // Decode the data from JSON to Provinces object.
            let provinces = try JSONDecoder().decode(Provinces.self, from: data)
            
            completion(true, provinces)
        } catch let error {
            completion(false, nil)
            print("Error jsonReader: \(error)")
        }
    } else {
        print("Error getting the path of the JSON file.")
        completion(false, nil)
    }
}
