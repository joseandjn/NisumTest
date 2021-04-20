//
//  AcromineResponse.swift
//  NisumApp
//
//  Created by Josean Donato Jaulis Nina on 4/18/21.
//  Copyright © 2021 Josean Donato Jaulis Nina. All rights reserved.
//

import Foundation

// MARK: - AbbreviationElement
struct AcromineResponse: Decodable {
    let sf: String
    let lfs: [Definition]
}

// MARK: - LF
struct Definition : Decodable {
    let lf: String
    let freq, since: Int
    let vars: [Definition]?
}
