//
//  Town.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta on 28/09/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import Foundation

struct Town: Codable {
    let postalCode: Int
    let name: String
    let locationLat: Double
    let locationLng: Double
}
