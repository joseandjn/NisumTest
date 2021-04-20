//
//  AcromineRepository.swift
//  NisumApp
//
//  Created by Josean Donato Jaulis Nina on 4/18/21.
//  Copyright © 2021 Josean Donato Jaulis Nina. All rights reserved.
//

import Foundation

protocol AcromineRepository {
    func searchAllDefinitions(abbreviation: String, callback : @escaping (ResponseGeneric<[AcromineResponse]>)->())
}

