//
//  Province.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta on 26/09/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import Foundation

struct Province: Codable {
    let id: Int
    let name: String
    let towns: [String]
}
